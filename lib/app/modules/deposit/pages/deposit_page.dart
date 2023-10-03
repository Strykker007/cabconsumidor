import 'package:brasil_fields/brasil_fields.dart';
import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabconsumidor/app//modules/deposit/deposit_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class DepositPage extends StatefulWidget {
  final String title;
  const DepositPage({Key? key, required this.title}) : super(key: key);
  @override
  DepositPageState createState() => DepositPageState();
}

class DepositPageState extends State<DepositPage> {
  late final DepositStore store = Modular.get<DepositStore>();
  late final UserStore userStore = Modular.get<UserStore>();
  final MoneyMaskedTextController amountController = MoneyMaskedTextController(
    decimalSeparator: ',', // Separador decimal
    thousandSeparator: '.', // Separador de milhar
  );

  @override
  void initState() {
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
          children: <Widget>[
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormFieldWidget(
                  showCursor: true,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  borderColor: Theme.of(context).primaryColor,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    RealInputFormatter(moeda: true),
                  ],
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
                    store.state.amount = amount;
                    store.state.userId = userStore.state.user!.userId;
                    store.updateForm(store.state);
                    // store.update(store.state, force: true);
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Digite o valor que deseja depositar',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
            ),
            const Spacer(),
            TripleBuilder(
              store: store,
              builder: (_, triple) {
                return DefaultButtonWidget(
                  text: 'Depositar',
                  isDisabled: store.state.amount == null,
                  onPressed: () async {
                    await store
                        .depositAmount(
                      store.state,
                    )
                        .then(
                      (value) {
                        Modular.to.pushReplacementNamed(
                          '/home/deposit/sucess_deposit_page',
                        );
                      },
                    ).catchError((onError) {
                      Helpers.showDefaultDialog(
                        context,
                        RequestErrorWidget(
                          error: onError,
                          buttonText: 'Fechar',
                          onPressed: () {
                            Modular.to.pop();
                          },
                        ),
                      );
                    });
                  },
                  isLoading: store.isLoading,
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
