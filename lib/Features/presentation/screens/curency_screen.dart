import 'package:currency/Features/domain/use_cases/currency_use_case.dart';
import 'package:currency/Features/presentation/cubit/cubit.dart';
import 'package:currency/Features/presentation/cubit/state.dart';
import 'package:currency/core/utils/app_colors.dart';
import 'package:currency/core/utils/extenctions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_strings.dart';
import '../widgets/Row_currency.dart';
import '../widgets/convert_button.dart';

import '../widgets/currency_exchange.dart';
import '../widgets/text_field.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});
  Widget _buildScreen() {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<AppCubit>(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CurrencyExchange(cubit: cubit),
                Card(
                  elevation: 10,
                  color: AppColors.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RowCurrency(cubit: cubit),
                        30.0.height,
                         TextFiledItem(
                          controller: cubit.textEditingController,
                        ),
                        10.0.height,
                        if (state is SuccessAppState)
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.yellowColor,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  '${state.currencyEntity.results!.country*
                                      check(x: cubit.textEditingController.text)}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (state is LoadingAppState)
                          const CircularProgressIndicator(
                            color: AppColors.yellowColor,
                          ),
                        if (state is ErrorAppState)
                          Text(
                            state.error,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                            ),
                          ),
                        10.0.height,
                      ],
                    ),

                  ),
                ),
                ConvertButton(
                  function: () {
                    if(cubit.textEditingController.text=='') {
                      cubit.textEditingController.text='1';
                    }
                    cubit.getData(Data(from: cubit.from, to: cubit.to));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.currency),
      ),
      body: _buildScreen(),
    );
  }
  double check({String ? x})
  {
    if (x==null|| x=='') {
      return 1.0;
    }
    return double.parse(x);
  }
}

