import 'dart:developer';

import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/core/utils/formaters.dart';
import 'package:cabconsumidor/app/modules/transactions/stores/transactions_date_filter_store.dart';
import 'package:cabconsumidor/app/modules/transactions/stores/transactions_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DateFilterWidget extends StatefulWidget {
  final int filterValue;
  const DateFilterWidget({super.key, required this.filterValue});

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  final TransactionsDateFilterStore store = Modular.get();
  final TransactionsStore transactionsStore = Modular.get();
  final UserStore userStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () async {
                store.updateFilter(30);
                transactionsStore.params.finalDate =
                    Formaters.dateToStringDateWithHifen(DateTime.now());
                transactionsStore.params.initialDate =
                    Formaters.dateToStringDateWithHifen(
                  DateTime.now().subtract(
                    Duration(
                      days: store.state,
                    ),
                  ),
                );
                await transactionsStore.getTransactionsList();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: store.state == 30 ? theme.primaryColor : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '30 Dias',
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: store.state == 30 ? theme.primaryColor : Colors.grey,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                store.updateFilter(60);
                transactionsStore.params.finalDate =
                    Formaters.dateToStringDateWithHifen(DateTime.now());
                transactionsStore.params.initialDate =
                    Formaters.dateToStringDateWithHifen(
                  DateTime.now().subtract(
                    Duration(
                      days: store.state,
                    ),
                  ),
                );
                await transactionsStore.getTransactionsList();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: store.state == 60 ? theme.primaryColor : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '60 Dias',
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: store.state == 60 ? theme.primaryColor : Colors.grey,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                store.updateFilter(90);
                transactionsStore.params.finalDate =
                    Formaters.dateToStringDateWithHifen(DateTime.now());
                transactionsStore.params.initialDate =
                    Formaters.dateToStringDateWithHifen(
                  DateTime.now().subtract(
                    Duration(
                      days: store.state,
                    ),
                  ),
                );
                await transactionsStore.getTransactionsList();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: store.state == 90 ? theme.primaryColor : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '90 Dias',
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: store.state == 90 ? theme.primaryColor : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
