import 'package:currency_app/web_api/dto/rates.dart';
import 'package:flutter/material.dart';

class CurrencyTableItem extends StatelessWidget {
  final Rates rate;
  const CurrencyTableItem({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    const styles = TextStyle(
      fontFamily: 'Roboto',
      color: Color(0xFF5E6972),
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
