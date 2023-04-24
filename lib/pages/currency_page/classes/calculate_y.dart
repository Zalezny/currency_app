import 'package:currency_app/web_api/dto/rates.dart';

class CalculatorY {
  final List<Rates> rates;
  late double _minY;
  late double _maxY;
  CalculatorY({required this.rates}) {
    _minY = rates.first.mid!;
    _maxY = rates.first.mid!;
    _calculate();
  }

  void _calculate() {
    for (final rate in rates) {
      if (rate.mid! > _maxY) {
        _maxY = rate.mid!;
      }
      if (rate.mid! < _minY) {
        _minY = rate.mid!;
      }
    }
  }

  double get minY {
    return _minY;
  }

  double get maxY {
    return _maxY;
  }

  double get roundedMinY {
    return (_minY / 0.05).roundToDouble() * 0.05;
  }
  double get roundedMaxY {
    return (_maxY / 0.05).roundToDouble() * 0.05;
  }
}
