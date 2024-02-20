import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/show_currency.dart';
import '../cubit/cubit.dart';
import 'currency_button.dart';

class CurrencyExchange extends StatelessWidget {
  const CurrencyExchange({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CurrencyButton(
          function: () async {
            cubit.changeFrom(await showCurrency(context: context));
          },
          text: cubit.from,
        ),
        IconButton(
          onPressed: () {
            String swap = cubit.to;
            cubit.changeTo(cubit.from);
            cubit.changeFrom(swap);
          },
          style: IconButton.styleFrom(
            backgroundColor: AppColors.pinkColor,
            elevation: 20,
          ),
          icon: const Icon(
            Icons.swap_horiz_outlined,
            color: Colors.white,
          ),
        ),
        CurrencyButton(
          function: () async {
            cubit.changeTo(await showCurrency(context: context));
          },
          text: cubit.to,
        ),
      ],
    );
  }
}
