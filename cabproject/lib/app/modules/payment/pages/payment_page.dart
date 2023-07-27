import 'package:brasil_fields/brasil_fields.dart';
import 'package:cabproject/app/core/enums/buttons_enum.dart';
import 'package:cabproject/app/core/enums/transaction_type_enum.dart';
import 'package:cabproject/app/core/models/seller_model.dart';
import 'package:cabproject/app/core/services/helpers.dart';
import 'package:cabproject/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabproject/app/core/shared/widgets/loading/loading_widget.dart';
import 'package:cabproject/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabproject/app/core/stores/user_store.dart';
import 'package:cabproject/app/core/utils/utils.dart';
import 'package:cabproject/app/modules/payment/widgets/seller_details_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabproject/app/modules/payment/payment_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PaymentPage extends StatefulWidget {
  final SellerModel? seller;
  const PaymentPage({Key? key, this.seller}) : super(key: key);
  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  final PaymentStore store = Modular.get();
  final UserStore userStore = Modular.get();
  final MoneyMaskedTextController amountController = MoneyMaskedTextController(
    decimalSeparator: ',', // Separador decimal
    thousandSeparator: '.', // Separador de milhar
  );
  final TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    if (widget.seller != null) {
      codeController.text = widget.seller!.code!;
      store.state.stablishmentCode = widget.seller!.code!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextFormFieldWidget(
                showCursor: false,
                textAlign: TextAlign.center,
                controller: amountController,
                borderColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.number,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                    ),
                hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                hintText: 'R\$ 0,00',
                onChange: (amount) {
                  if (amount!.isNotEmpty) {
                    store.state.amount =
                        UtilBrasilFields.converterMoedaParaDouble(amount);
                    store.update(store.state, force: true);
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Digite o valor que deseja transferir',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.grey,
                  fontSize: 12,
                ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextFormFieldWidget(
                showCursor: false,
                textAlign: TextAlign.center,
                controller: codeController,
                borderColor: Theme.of(context).primaryColor,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                    ),
                hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                hintText: 'Código do vendedor',
                onChange: (code) async {
                  if (code!.length > 3) {
                    await store.getSellerData(code).then(
                      (value) {
                        store.state.stablishmentName = '';
                      },
                    );
                  }
                },
                suffixIcon: IconButton(
                  onPressed: () async {
                    String? code = await Utils.scanQRCode();
                    if (code != null) {
                      store.state.stablishmentCode = code;
                      await store.getSellerData(code).then(
                        (value) {
                          store.state.stablishmentName = '';
                        },
                      );
                    }
                  },
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              'Digite o código do vendendor que deseja pagar',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          TripleBuilder(
            store: store,
            builder: (context, triple) {
              if (triple.isLoading) {
                return const LoadingWidget();
              }
              if (store.seller == null || widget.seller == null) {
                return Container();
              }
              return SellerDetailsWidget(
                seller: store.seller!,
              );
            },
          ),
          const SizedBox(height: 10),
          TripleBuilder(
            store: store,
            builder: (_, triple) {
              return DefaultButtonWidget(
                text: 'Pagar',
                isDisabled: false,
                // store.state.amount == null || store.state.amount! <= 0,
                onPressed: () async {
                  showConfirmDialog();
                },
                isLoading: store.isLoading,
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> showConfirmDialog() {
    return Helpers.showDefaultDialog(
      context,
      Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Deseja realmente prosseguir com esta ação?'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultButtonWidget(
                  text: 'Cancelar',
                  isDisabled: false,
                  onPressed: () {
                    Modular.to.pop();
                  },
                  isLoading: false,
                ),
                const SizedBox(width: 20),
                DefaultButtonWidget(
                  buttonType: DefaultButtonType.outline,
                  text: 'Confirmar',
                  isDisabled: false,
                  onPressed: () async {
                    Modular.to.pop();
                    store.state.transactionType = TransactionType.payment;
                    if (widget.seller != null) {
                      store.state.stablishmentName =
                          'Pag. ${widget.seller!.name!}';
                      store.state.stablishmentCode = widget.seller!.code;
                    } else {
                      store.state.stablishmentCode = store.seller!.code;
                      store.state.stablishmentName =
                          'Pag. ${store.seller!.name!}';
                    }
                    await store
                        .payAmount(userStore.state.user!.userId!.toString(),
                            store.state)
                        .then(
                      (value) {
                        Modular.to
                            .navigate('/home/payment/sucess_payment_page');
                      },
                    ).catchError(
                      (onError) {
                        Helpers.showErrorDialog(
                          onError.message.toString(),
                          context,
                          onPressed: () {
                            Modular.to.pop();
                          },
                        );
                      },
                    );
                  },
                  isLoading: false,
                ),
              ],
            )
          ],
        ),
      ),
      showClose: true,
    );
  }
}
