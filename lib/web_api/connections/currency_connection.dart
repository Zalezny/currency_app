import 'dart:convert';

import 'package:currency_app/enums/code_enum.dart';
import 'package:currency_app/web_api/config.dart';
import 'package:currency_app/web_api/dto/currency_dto.dart';
import 'package:currency_app/web_api/exceptions/cant_fetch_data_exception.dart';
import 'package:currency_app/web_api/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class CurrencyConnection {
  final ApiService apiService = GetIt.I<ApiService>();

  Future<CurrencyDto> _getCurrency(CodeEnum code) async {
    final uri = Config.currencyUrl(_codeString(code));
    final Response response = await apiService.makeApiGetRequest(uri);

    if (response.statusCode == 404) {
      throw CantFetchDataException();
    } else {
      final Map<String, dynamic> body = json.decode(response.body);
      return CurrencyDto.fromJson(body);
    }
  }

  Future<List<CurrencyDto>> getCurrenciesList(List<CodeEnum> codes) async {
    List<CurrencyDto> currenciesList = [];

    for (final code in codes) {
      currenciesList.add(await _getCurrency(code));
    }

    return currenciesList;
  }

  Future<CurrencyDto> getCurrencyByLast(CodeEnum code, int lastNum) async {
    final uri = Config.currencyUrlByLast(_codeString(code), lastNum);
    final Response response = await apiService.makeApiGetRequest(uri);

    if (response.statusCode == 404) {
      throw CantFetchDataException();
    } else {
      final Map<String, dynamic> body = json.decode(response.body);
      return CurrencyDto.fromJson(body);
    }
  }

  String _codeString(CodeEnum code) {
    return code == CodeEnum.eur ? "eur" : "usd";
  }
}
