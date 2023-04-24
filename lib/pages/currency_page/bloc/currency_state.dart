part of 'currency_bloc.dart';

@immutable
abstract class CurrencyState {}

class CurrencyLoadingState extends CurrencyState {
  @override
  String toString() => 'CurrencyLoading {}';
}

class CurrencyFailState extends CurrencyState {
  final String message;
  CurrencyFailState(this.message);

  @override
  String toString() => 'CurrencyFail {message: $message}';
}

class CurrencySuccessState extends CurrencyState {
  final CurrencyDto model;
  CurrencySuccessState(this.model);

  @override
  String toString() => 'CurrencySucces {model: $model}';
}
