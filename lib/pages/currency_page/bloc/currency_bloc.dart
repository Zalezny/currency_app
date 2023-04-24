import 'package:bloc/bloc.dart';
import 'package:currency_app/enums/code_enum.dart';
import 'package:currency_app/web_api/connections/currency_connection.dart';
import 'package:currency_app/web_api/dto/currency_dto.dart';
import 'package:meta/meta.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyConnection currencyConnection;
  final CodeEnum code;
  final int lastNum;

  CurrencyBloc(this.currencyConnection, this.code, this.lastNum)
      : super(CurrencyLoadingState()) {
    on<CurrencyEvent>((event, emit) async {
      emit(CurrencyLoadingState());

      try {
        final model = await currencyConnection.getCurrencyByLast(code, lastNum);
        emit(CurrencySuccessState(model));
      } catch (e) {
        emit(CurrencyFailState(e.toString()));
      }
    });
  }
}
