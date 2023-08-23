import 'package:brasil_fields/brasil_fields.dart';
import 'package:cabconsumidor/app/core/enums/buttons_enum.dart';
import 'package:cabconsumidor/app/core/models/seller_model.dart';
import 'package:cabconsumidor/app/core/models/transaction_model.dart';
import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/core/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabconsumidor/app/modules/payment/payment_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PaymentPage extends StatefulWidget {
  final SellerModel? seller;
  final String title;
  const PaymentPage({Key? key, this.seller, required this.title})
      : super(key: key);
  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  final PaymentStore store = Modular.get();
  final UserStore userStore = Modular.get();
  final TransactionModel payment = TransactionModel();
  final MoneyMaskedTextController amountController = MoneyMaskedTextController(
    decimalSeparator: ',', // Separador decimal
    thousandSeparator: '.', // Separador de milhar
  );
  final TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    if (widget.seller != null) {
      codeController.text = widget.seller!.pk!.toString();
      payment.sellerId = widget.seller!.pk;
      store.getSellerData(widget.seller!.pk.toString());
    }
    payment.userId = userStore.state.user!.userId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBarWidget(
          title: widget.title,
          backgroundColor: Colors.transparent,
        ).build(context) as AppBar,
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
                  textInputAction: TextInputAction.done,
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
                      payment.amount =
                          UtilBrasilFields.converterMoedaParaDouble(amount)
                              .toString();
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
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.center,
                  controller: codeController,
                  borderColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.number,
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
                    await store.getSellerData(code!).then((value) {
                      if (store.seller != null) {
                        payment.sellerId = store.seller!.pk;
                      }
                    });
                  },
                  suffixIcon: IconButton(
                    onPressed: () async {
                      String? code = await Utils.scanQRCode();
                      if (code != null) {
                        payment.sellerId = double.tryParse(code)!.toInt();
                        await store.getSellerData(code);
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
            // TripleBuilder(
            //   store: store,
            //   builder: (context, triple) {
            //     if (triple.isLoading) {
            //       return const LoadingWidget();
            //     }
            //     if (store.seller == null && widget.seller == null) {
            //       return Container();
            //     }
            //     return SellerDetailsWidget(
            //       seller: store.seller!,
            //     );
            //   },
            // ),
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
                    await store.payAmount(payment).then(
                      (value) {
                        Modular.to.pushReplacementNamed(
                          '/home/payment/sucess_payment_page',
                        );
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
