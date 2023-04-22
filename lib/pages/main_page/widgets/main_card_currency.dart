import 'package:currency_app/enums/code_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainCardCurrency extends StatelessWidget {
  final CodeEnum currrencyCode;
  const MainCardCurrency({super.key, required this.currrencyCode});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: IntrinsicWidth(
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/pencil_icon.svg',
            width: 15,
            height: 15,
          ),
          Column(
            children: [Text("EUR"), Text("Europeanian Union")],
          )
        ],
      ),
    ));
  }
}
