import 'package:currency/Features/domain/entities/currency.dart';

abstract class AppState {}

class InitState extends AppState {}

class LoadingAppState extends AppState {}

class SuccessAppState extends AppState{
  final CurrencyEntity currencyEntity;

  SuccessAppState({required this.currencyEntity});
}

class ErrorAppState extends AppState{
  final String error;

  ErrorAppState({required this.error});
}

class ChangeTO extends AppState{}
class ChangeFrom extends AppState{}

