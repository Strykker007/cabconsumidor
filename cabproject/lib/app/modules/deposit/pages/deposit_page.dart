import 'package:brasil_fields/brasil_fields.dart';
import 'package:cabproject/app/core/enums/transaction_type_enum.dart';
import 'package:cabproject/app/core/models/transaction_model.dart';
import 'package:cabproject/app/core/shared/widgets/app_bar_widget.dart';
import 'package:cabproject/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabproject/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabproject/app/core/stores/user_store.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabproject/app//modules/deposit/deposit_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class DepositPage extends StatefulWidget {
  final String title;
  const DepositPage({Key? key, required this.title}) : super(key: key);
  @override
  DepositPageState createState() => DepositPageState();
}

class DepositPageState extends State<DepositPage> {
  late final DepositStore store;
  late final UserStore userStore;
  final MoneyMaskedTextController amountController = MoneyMaskedTextController(
    decimalSeparator: ',', // Separador decimal
    thousandSeparator: '.', // Separador de milhar
  );

  @override
  void initState() {
    store = Modular.get<DepositStore>();
    userStore = Modular.get<UserStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        backgroundColor: Colors.transparent,
      ).build(context) as AppBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Depositar',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
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
                  if (amount!.isNotEmpty) {
                    store.state.amount =
                        UtilBrasilFields.converterMoedaParaDouble(amount);
                    store.state.transactionType = TransactionType.deposit;
                    store.state.stablishmentName = 'Depósito via Pix';
                    store.update(store.state, force: true);
                  } else {
                    store.update(TransactionModel(), force: true);
                  }
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
                isDisabled:
                    store.state.amount == null || store.state.amount! <= 0,
                onPressed: () async {
                  await store
                      .depositAmount(
                          userStore.state.user!.userId.toString(), store.state)
                      .then(
                    (value) {
                      Modular.to.navigate('/home/deposit/sucess_deposit_page');
                    },
                  );
                },
                isLoading: store.isLoading,
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
