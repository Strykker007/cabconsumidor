import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../core/utils/formaters.dart';
import '../../transactions/stores/transactions_store.dart';
import '../stores/home_transaction_list_filter_store.dart';

class HomeTransactionsFilterWidget extends StatefulWidget {
  const HomeTransactionsFilterWidget({super.key});

  @override
  State<HomeTransactionsFilterWidget> createState() =>
      _HomeTransactionsFilterWidgetState();
}

class _HomeTransactionsFilterWidgetState
    extends State<HomeTransactionsFilterWidget> {
  final HomeTransactionListFilterStore transactionFilterStore = Modular.get();
  final TransactionsStore transactionsStore = Modular.get<TransactionsStore>();
  @override
  Widget build(BuildContext context) {
    return TripleBuilder(
      store: transactionFilterStore,
      builder: (context, triple) {
        return GestureDetector(
          onTap: () async {
            transactionFilterStore.updateFilter();
            transactionsStore.params.initialDate =
                Formaters.dateToStringDateWithHifen(
              DateTime.now().subtract(
                Duration(
                  days: transactionFilterStore.state,
                ),
              ),
            );
            await transactionsStore.getTransactionsList();
          },
          child: Row(
            children: [
              const Icon(
                Icons.keyboard_arrow_down_outlined,
              ),
              Text(
                '${triple.state} Dias',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
