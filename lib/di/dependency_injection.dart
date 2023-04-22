import 'package:currency_app/web_api/connections/currency_connection.dart';
import 'package:currency_app/web_api/services/api_service.dart';
import 'package:get_it/get_it.dart';

void setupDependencyInjection() {
  GetIt.I.registerLazySingleton<ApiService>(
    () => ApiService(),
  );
  GetIt.I.registerLazySingleton<CurrencyConnection>(
    () => CurrencyConnection(),
  );
}
