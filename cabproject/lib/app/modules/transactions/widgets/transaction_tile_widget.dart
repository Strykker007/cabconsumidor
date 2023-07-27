import 'package:cabproject/app/core/models/transaction_model.dart';
import 'package:cabproject/app/core/enums/transaction_type_enum.dart';
import 'package:cabproject/app/core/services/formatters.dart';
import 'package:flutter/material.dart';

class TransactionTileWidget extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionTileWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon(transaction.transactionType!)!,
          const SizedBox(
            height: 5,
          ),
          Text(
            'R\$ ${transaction.amount!.toStringAsFixed(2)}',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey.shade700, fontSize: 14),
          ),
        ],
      ),
      trailing: SizedBox(
        width: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: 15,
                ),
                Text(
                  Formatters.dateAndMonthToStringDate(
                    transaction.date!,
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 12),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.watch_later_outlined,
                  size: 15,
                ),
                Text(
                  Formatters.dateToStringTime(
                    transaction.date!,
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              transaction.stablishmentName!,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
