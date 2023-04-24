import 'package:currency_app/web_api/dto/rates.dart';

class CalculatorY {
  final List<Rates> rates;
  double? minY;
  double? maxY;
  CalculatorY({required this.rates}) {
    _calculate();
  }

  void _calculate() {
    maxY = rates.first.mid;
    minY = rates.first.mid;
    for (final rate in rates) {
      if (rate.mid! > maxY!) {
        maxY = rate.mid!;
      }
      if (rate.mid! < minY!) {
        minY = rate.mid!;
      }
    }
  }
}
