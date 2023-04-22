part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainLoadingState extends MainState {
  @override
  String toString() => 'MainProgress {}';
}

class MainFailState extends MainState {
  final String message;
  MainFailState(this.message);

  @override
  String toString() => 'MainFail {message: $message}';
}

class MainSuccessState extends MainState {
  final CurrencyDto model;
  MainSuccessState(this.model);

  @override
  String toString() => 'MainSuccess {model: $model}';
}
