import 'package:cabconsumidor/app/core/models/deposit_history_model.dart';
import 'package:cabconsumidor/app/core/services/formatters.dart';
import 'package:flutter/material.dart';

class DepositHistoryTileWidget extends StatelessWidget {
  final DepositHistoryModel deposit;
  const DepositHistoryTileWidget({super.key, required this.deposit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // icon(deposit.oparationType!)!,
            const SizedBox(
              height: 5,
            ),
            Text(
              'R\$ ${deposit.amount!}',
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
                  color: deposit.approved! ? Colors.green : Colors.orangeAccent,
                ),
              ),
              child: Text(
                deposit.approved! ? 'Aprovado' : 'Em análise',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      color: deposit.approved!
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
                  Formatters.dateToStringDate(
                    Formatters.stringToDate(deposit.creationDate!),
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
                    Formatters.stringToDateTime(deposit.creationDate!),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
