import 'package:currency_app/web_api/dto/rates.dart';

class CurrencyDto {
  String? table;
  String? currency;
  String? code;
  List<Rates>? rates;

  CurrencyDto({this.table, this.currency, this.code, this.rates});

  CurrencyDto.fromJson(Map<String, dynamic> json) {
    table = json['table'];
    currency = json['currency'];
    code = json['code'];
    if (json['rates'] != null) {
      rates = <Rates>[];
      json['rates'].forEach((v) {
        rates!.add(Rates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['table'] = table;
    data['currency'] = currency;
    data['code'] = code;
    if (rates != null) {
      data['rates'] = rates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}