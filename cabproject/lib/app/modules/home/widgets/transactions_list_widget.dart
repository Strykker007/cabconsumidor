import 'package:cabproject/app/core/enums/buttons_enum.dart';
import 'package:cabproject/app/core/models/transaction_model.dart';
import 'package:cabproject/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabproject/app/core/stores/user_store.dart';
import 'package:cabproject/app/modules/transactions/transactions_store.dart';
import 'package:cabproject/app/modules/transactions/widgets/transaction_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TransactionListWidget extends StatelessWidget {
  final List<TransactionModel> transactions;
  const TransactionListWidget({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final TransactionsStore store = Modular.get();
    final UserStore userStore = Modular.get();

    return Expanded(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: transactions.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Nenhuma transação encontrada!'),
                    const SizedBox(height: 10),
                    DefaultButtonWidget(
                      buttonType: DefaultButtonType.outline,
                      text: 'Atualizar',
                      onPressed: () async {
                        await store.getTransactionsList(
                            userStore.state.user!.userId!.toString());
                      },
                      isLoading: false,
                      isDisabled: false,
                    ),
                  ],
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.wallet),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Transações',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.black45,
                                  ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              '7 dias',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            )
                          ],
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Flexible(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await store.getTransactionsList(
                              userStore.state.user!.userId!.toString());
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                reverse: true,
                                itemBuilder: (context, index) {
                                  return TransactionTileWidget(
                                    transaction: transactions[index],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    color: Colors.grey,
                                  );
                                },
                                itemCount: transactions.length,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
