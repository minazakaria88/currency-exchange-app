import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class TextFiledItem extends StatelessWidget {
  const TextFiledItem({
    super.key, required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          controller: controller,
          cursorColor: AppColors.pinkColor,
          cursorHeight: 20,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.pinkColor
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.pinkColor
              ),
            ),
          ),
          keyboardType: TextInputType.number,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}