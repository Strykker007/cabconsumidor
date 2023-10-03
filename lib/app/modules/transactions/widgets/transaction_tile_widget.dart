import 'package:cabconsumidor/app/core/enums/transaction_type_enum.dart';
import 'package:cabconsumidor/app/core/models/transaction_register_model.dart';
import 'package:cabconsumidor/app/core/services/formatters.dart';
import 'package:flutter/material.dart';

class TransactionTileWidget extends StatelessWidget {
  final TransactionRegisterModel transaction;
  const TransactionTileWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon(transaction.oparationType!)!,
                const SizedBox(
                  width: 5,
                ),
                const SizedBox(width: 5),
                Text(
                  'R\$ ${transaction.amount!}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.grey.shade700, fontSize: 17),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'ID: ${transaction.id.toString()}',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
            )
          ],
        ),
        const Spacer(),
        Column(
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
                  Formatters.dateToStringDate(
                    Formatters.stringToDate(transaction.date!),
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
                    Formatters.stringToDateTime(transaction.date!),
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
              transaction.operationDescription!,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
            ),
            // Text(
            //   transaction.name!,
            //   textAlign: TextAlign.right,
            //   style: Theme.of(context).textTheme.bodySmall!.copyWith(
            //       fontSize: 12,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black),
            // )
          ],
        ),
      ],
    );
  }
}
