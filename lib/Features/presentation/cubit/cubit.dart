import 'package:currency/Features/domain/use_cases/currency_use_case.dart';
import 'package:currency/Features/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.currencyUseCase}) : super(InitState());

  final CurrencyUseCase currencyUseCase;
  Future<void> getData(Data data) async {
    emit(LoadingAppState());
    var result = await currencyUseCase(data);
    emit(
      result.fold(
        (failure) => ErrorAppState(error: failure.error),
        (currency) => SuccessAppState(currencyEntity: currency),
      ),
    );
  }

  String from='USD';
  String to='EGP';

  void changeFrom(String s)
  {
    from=s;
    emit(ChangeFrom());
  }

  void changeTo(String s)
  {
    to=s;
    emit(ChangeFrom());
  }

  TextEditingController textEditingController=TextEditingController();

}
