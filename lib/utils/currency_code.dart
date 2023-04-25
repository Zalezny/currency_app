import 'code_enum.dart';

class CurrencyCode {
  CodeEnum code;
  CurrencyCode({required this.code});

  String get currencyCode {
    if (code == CodeEnum.eur) {
      return "EUR";
    } else {
      return "USD";
    }
  }

  bool get isEuro {
    if (code == CodeEnum.eur) {
      return true;
    }
    return false;
  }
}
