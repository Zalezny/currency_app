import 'package:currency_app/colors/app_colors.dart';
import 'package:currency_app/web_api/dto/rates.dart';
import 'package:flutter/material.dart';

class CurrencyTableItem extends StatelessWidget {
  final Rates rate;
  const CurrencyTableItem({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    final styles = TextStyle(
      fontFamily: 'Roboto',
      color: AppColors.grey,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(rate.effectiveDate!, style: styles),
        Text(rate.mid.toString(), style: styles),
      ],
    );
  }
}
