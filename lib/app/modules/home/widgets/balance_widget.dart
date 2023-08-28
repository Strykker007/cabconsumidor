import 'package:brasil_fields/brasil_fields.dart';
import 'package:cabconsumidor/app/core/services/preferences_service.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/core/utils/utils.dart';
import 'package:cabconsumidor/app/modules/home/stores/balance_store.dart';
import 'package:cabconsumidor/app/modules/home/stores/obscure_balance_store.dart';
import 'package:cabconsumidor/app/modules/home/widgets/balance_loading_widget.dart';
import 'package:cabconsumidor/app/modules/transactions/transactions_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class BalanceWidget extends StatefulWidget {
  final BalanceStore balanceStore;
  const BalanceWidget({super.key, required this.balanceStore});

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  final ObscureBalanceStore obscureBalanceStore = Modular.get();
  final PreferencesService service = PreferencesService();
  final TransactionsStore store = Modular.get();
  final UserStore userStore = Modular.get();

  @override
  void initState() {
    service.getObscureBalancePreference().then((value) {
      obscureBalanceStore.updateState(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saldo',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                    ),
                    Text(
                      'Hoje, ${DateTime.now().day} ${Utils.getShortMonthName(DateTime.now().month)}.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Modular.to.pushNamed(
                      '/home/deposit',
                      arguments: 'Depositar',
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Adicionar',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            widget.balanceStore.isLoading
                ? const BalanceLoadingWidget()
                : Visibility(
                    visible: widget.balanceStore.state.balance != null,
                    child: TripleBuilder(
                      store: obscureBalanceStore,
                      builder: (context, triple) {
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'R\$ ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  TextSpan(
                                    text: obscureBalanceStore.state
                                        ? '* * * *'
                                        : UtilBrasilFields.obterReal(
                                            widget.balanceStore.state.balance!
                                                .toDouble(),
                                            moeda: false,
                                          ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: obscureBalanceStore.state
                                              ? Colors.grey
                                              : Colors.black,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                obscureBalanceStore
                                    .updateState(!obscureBalanceStore.state);
                                if (obscureBalanceStore.state == false) {
                                  // await balanceStore.getBalanceValue(
                                  //     userStore.state.userId!.toString());
                                  await store.getTransactionsList(
                                      userStore.state.user!.userId!.toString());
                                }
                              },
                              icon: obscureBalanceStore.state
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                          ],
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
