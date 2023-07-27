import 'package:cabproject/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabproject/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabproject/app/core/stores/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabproject/app/modules/bankData/bank_data_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class BankDataPage extends StatefulWidget {
  final String title;
  const BankDataPage({Key? key, this.title = 'BankDataPage'}) : super(key: key);
  @override
  BankDataPageState createState() => BankDataPageState();
}

class BankDataPageState extends State<BankDataPage> {
  final BankDataStore store = Modular.get();
  final UserStore userStore = Modular.get();

  final TextEditingController accountController = TextEditingController();
  final TextEditingController accountDigitController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController agencyController = TextEditingController();
  final TextEditingController agencyDigitController = TextEditingController();

  @override
  void initState() {
    accountController.text = userStore.state.user!.bankData!.account ?? '';
    accountDigitController.text =
        userStore.state.user!.bankData!.accountDigit ?? '';
    bankNameController.text = userStore.state.user!.bankData!.bankName ?? '';
    agencyController.text = userStore.state.user!.bankData!.agency ?? '';
    agencyDigitController.text =
        userStore.state.user!.bankData!.agencyDigit ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Modular.to.pushNamed('/home/config');
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ),
              ),
            ),
            TextFormFieldWidget(
              controller: bankNameController,
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Theme.of(context).primaryColor,
              ),
              onChange: (bankName) {
                userStore.state.user!.bankData!.bankName = bankName;
              },
              label: 'NOME DO BANCO',
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
              borderColor: Theme.of(context).primaryColor,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
            ),
            TextFormFieldWidget(
              controller: accountController,
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Theme.of(context).primaryColor,
              ),
              onChange: (account) {
                userStore.state.user!.bankData!.account = account;
              },
              label: 'NUMERO DA CONTA',
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
              borderColor: Theme.of(context).primaryColor,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
            ),
            TextFormFieldWidget(
              controller: accountDigitController,
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Theme.of(context).primaryColor,
              ),
              onChange: (accountDigit) {
                userStore.state.user!.bankData!.accountDigit = accountDigit;
              },
              label: 'DIGITO',
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
              borderColor: Theme.of(context).primaryColor,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
            ),
            TextFormFieldWidget(
              controller: agencyController,
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Theme.of(context).primaryColor,
              ),
              onChange: (agency) {
                userStore.state.user!.bankData!.agency = agency;
              },
              label: 'AGENCIA',
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
              borderColor: Theme.of(context).primaryColor,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
            ),
            TextFormFieldWidget(
              controller: agencyDigitController,
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Theme.of(context).primaryColor,
              ),
              onChange: (agencyDigit) {
                userStore.state.user!.bankData!.agencyDigit = agencyDigit;
              },
              label: 'DIGITO DA AGENCIA',
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
              borderColor: Theme.of(context).primaryColor,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: TripleBuilder(
                store: store,
                builder: (_, triple) {
                  return DefaultButtonWidget(
                    text: 'Salvar',
                    isDisabled: false,
                    onPressed: () async {
                      await store.updateBankData(
                        userStore.state.user!.userId!.toString(),
                        userStore.state.user!,
                      );
                    },
                    isLoading: store.isLoading,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
