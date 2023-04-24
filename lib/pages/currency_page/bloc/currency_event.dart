part of 'currency_bloc.dart';

@immutable
abstract class CurrencyEvent {}

class SendCurrencyEvent extends CurrencyEvent {}