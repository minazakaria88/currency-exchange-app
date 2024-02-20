import 'package:currency/core/utils/extenctions.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../cubit/cubit.dart';

class RowCurrency extends StatelessWidget {
  const RowCurrency({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cubit.from,
          style: const TextStyle(
            color: AppColors.pinkColor,
          ),
        ),
        10.0.width,
        Container(
          color: Colors.white,
          height: 20,
          width: 1,
        ),
        10.0.width,
        Text(
          cubit.to,
          style: const TextStyle(
            color: AppColors.yellowColor,
          ),
        ),
      ],
    );
  }
}