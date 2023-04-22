import 'package:bloc/bloc.dart';
import 'package:currency_app/web_api/dto/currency_dto.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainLoadingState()) {
    on<MainEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
