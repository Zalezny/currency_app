import 'package:currency_app/utils/currency_code.dart';
import 'package:currency_app/pages/currency_page/currency_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainCardCurrency extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String description;
  final String currencyValue;
  final CurrencyCode code;

  const MainCardCurrency({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.description,
    required this.currencyValue,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => CurrencyPage(
              code: code,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15.0)),
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: SvgPicture.asset(
                    iconAsset,
                    height: 40,
                    width: 40,
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
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor),
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
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
                      Text(
                        currencyValue,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
