import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MainCardCurrencyShimmer extends StatelessWidget {
  const MainCardCurrencyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      period: const Duration(milliseconds: 1250),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              ),
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: ClipOval(
                        child: Container(
                          color: Colors.grey,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: Colors.white,
                            ),
                            height: 18.0,
                            width: 48.0,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: Colors.white,
                            ),
                            height: 18.0,
                            width: 118.0,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: Colors.white,
                            ),
                            height: 22.0,
                            width: 48.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
