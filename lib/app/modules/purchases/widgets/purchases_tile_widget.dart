import 'package:cabconsumidor/app/core/models/purchase_model.dart';
import 'package:cabconsumidor/app/core/services/formatters.dart';
import 'package:flutter/material.dart';

class PurchasesTileWidget extends StatelessWidget {
  final PurchaseModel purchase;
  const PurchasesTileWidget({super.key, required this.purchase});

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
            const SizedBox(height: 5),
            Text(
              'ID: ${purchase.id}',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
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
                    Formatters.stringToDate(purchase.date!),
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
                    Formatters.stringToDateTime(purchase.date!),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              purchase.sellerName!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
