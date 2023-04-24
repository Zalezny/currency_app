import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CurrencyTableItemShimmers extends StatelessWidget {
  const CurrencyTableItemShimmers({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade500,
      highlightColor: Colors.grey.shade100,
      period: const Duration(milliseconds: 1250),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 13,
              width: 108.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
            Container(
              height: 13,
              width: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
          ],
        );
      }),
    );
  }
}
