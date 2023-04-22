import 'package:currency_app/enums/code_enum.dart';

class Config {
  static String get _basicUrl {
    return 'http://api.nbp.pl/api/exchangerates/rates';
  }
  static String currencyUrl(CodeEnum code) {
    return '$_basicUrl/a/${code.toString()}';
  }
}