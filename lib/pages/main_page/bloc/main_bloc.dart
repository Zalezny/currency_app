import 'package:bloc/bloc.dart';
import 'package:currency_app/enums/code_enum.dart';
import 'package:currency_app/web_api/connections/currency_connection.dart';
import 'package:currency_app/web_api/dto/currency_dto.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final CurrencyConnection currencyConnection;
  final List<CodeEnum> codes;

  MainBloc(this.currencyConnection, this.codes) : super(MainLoadingState()) {
    on<MainEvent>((event, emit) async {
      emit(MainLoadingState());

      try {
        final model = await currencyConnection.getCurrenciesList(codes);
        emit(MainSuccessState(model));
      } catch (e) {
        emit(MainFailState(e.toString()));
      }
    });
  }
}
