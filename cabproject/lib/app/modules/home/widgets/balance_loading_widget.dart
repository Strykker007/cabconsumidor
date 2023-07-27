import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BalanceLoadingWidget extends StatelessWidget {
  const BalanceLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'R\$ ',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        ColoredBox(
          color: Theme.of(context).colorScheme.background,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade600.withOpacity(0.25),
            highlightColor: Colors.grey.shade600.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
