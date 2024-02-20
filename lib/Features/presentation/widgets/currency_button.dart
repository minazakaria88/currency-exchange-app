
import 'package:currency/core/utils/app_colors.dart';
import 'package:currency/core/utils/extenctions.dart';
import 'package:flutter/material.dart';

class CurrencyButton extends StatelessWidget {
  const CurrencyButton({
    super.key, required this.function, required this.text,
  });
  final Function function;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        elevation: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
            ),
          ),
          10.0.width,
          const Icon(
            Icons.arrow_drop_down,
            color: AppColors.pinkColor,
            size: 25,
          ),
        ],
      ),
    );
  }
}