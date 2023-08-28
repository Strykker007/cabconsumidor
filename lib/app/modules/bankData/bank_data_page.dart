import 'package:cabconsumidor/app/core/enums/banks_enum.dart';
import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/dropdown/custom_dropdown_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/loading/loading_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/success/success_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabconsumidor/app/modules/bankData/bank_data_store.dart';
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

  final TextEditingController accountController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController agencyController = TextEditingController();
  final TextEditingController agencyDigitController = TextEditingController();

  @override
  void initState() {
    store
        .getBankData(store.userStore.state.user!.userId!.toString())
        .then((value) {
      accountController.text = store.state.account ?? '';

      bankNameController.text = getBankName(store.state.bankName!);
      agencyController.text = store.state.agency ?? '';
      agencyDigitController.text = store.state.dvAgency ?? '';
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        backgroundColor: Colors.transparent,
      ).build(context) as AppBar,
      body: TripleBuilder(
          store: store,
          builder: (context, triple) {
            if (triple.isLoading) {
              return const Center(child: LoadingWidget());
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  TripleBuilder(
                    store: store,
                    builder: (_, triple) {
                      return CustomDropdownTextField(
                        label: 'Banco',
                        isLoading: triple.isLoading,
                        dropdownOptions: BankEnum.values.toList(),
                        selectedOption: store.state.bankName,
                        displayItemName: (state) => state.label!,
                        selectValueText: 'Selecione o nome do banco',
                        onChanged: (value) async {
                          String? code = getCodeByEnum(value!);
                          store.state.bankName = getBankByCode(
                            code!,
                          );
                          store.update(store.state, force: true);
                        },
                      );
                    },
                  ),
                  TextFormFieldWidget(
                    controller: accountController,
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Theme.of(context).primaryColor,
                    ),
                    onChange: (account) {
                      store.state.account = account;
                    },
                    keyboardType: TextInputType.number,
                    label: 'NUMERO DA CONTA',
                    labelStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                      store.state.agency = agency;
                    },
                    keyboardType: TextInputType.number,
                    label: 'AGENCIA',
                    labelStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                    keyboardType: TextInputType.number,
                    onChange: (agencyDigit) {
                      store.state.dvAgency = agencyDigit;
                    },
                    label: 'DIGITO DA AGENCIA',
                    labelStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                            await store
                                .updateBankData(
                              store.state,
                            )
                                .then((value) {
                              Helpers.showDefaultDialog(
                                context,
                                SuccessWidget(
                                  label: 'Sucesso',
                                  message: 'Informações atualizadas!',
                                  onPressed: () {
                                    Modular.to.pop();
                                  },
                                ),
                              );
                            }).catchError((onError) {
                              Helpers.showDefaultDialog(
                                context,
                                RequestErrorWidget(
                                  buttonText: 'Fechar',
                                  error: onError,
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
                  ),
                ],
              ),
            );
          }),
    );
  }
}
