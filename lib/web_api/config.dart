class Config {
  static String get _basicUrl {
    return 'http://api.nbp.pl/api/exchangerates/rates';
  }

  static String currencyUrl(String code) {
    return '$_basicUrl/a/${code.toString()}';
  }

  static String currencyUrlByLast(String code, int lastNum) {
    return '$_basicUrl/a/${code.toString()}/last/$lastNum';
  }
}
