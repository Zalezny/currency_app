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

  Future<CurrencyDto> getCurrency(CodeEnum code) async {
    final uri = Config.currencyUrl(code);
    final Response response = await apiService.makeApiGetRequest(uri);

    if (response.statusCode == 404) {
      throw CantFetchDataException();
    } else {
      final Map<String, dynamic> body = json.decode(response.body);
      return CurrencyDto.fromJson(body);
    }
  }
}
