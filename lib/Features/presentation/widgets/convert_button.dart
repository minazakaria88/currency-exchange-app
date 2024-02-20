import 'package:currency/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  const ConvertButton({
    super.key, required this.function,
  });
  final Function function;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor:AppColors.pinkColor,
          ),
          onPressed: () {
            function();
          },
          child: const Text(
            'convert',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
            ),
          )),
    );
  }
}