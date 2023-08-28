import 'package:cabconsumidor/app/core/models/deposit_history_model.dart';
import 'package:cabconsumidor/app/core/services/formatters.dart';
import 'package:flutter/material.dart';

class DepositHistoryTileWidget extends StatelessWidget {
  final DepositHistoryModel purchase;
  const DepositHistoryTileWidget({super.key, required this.purchase});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // icon(purchase.oparationType!)!,
            const SizedBox(
              height: 5,
            ),
            Text(
              'R\$ ${purchase.amount!}',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey.shade700, fontSize: 17),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color:
                      purchase.approved! ? Colors.green : Colors.orangeAccent,
                ),
              ),
              child: Text(
                purchase.approved! ? 'Aprovado' : 'Em análise',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      color: purchase.approved!
                          ? Colors.green
                          : Colors.orangeAccent,
                    ),
              ),
            ),
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
                  Formatters.dateAndMonthToStringDate(
                    Formatters.stringToDate(purchase.updatedDate!),
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
                    Formatters.stringToDateTime(purchase.updatedDate!),
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
