import 'package:flutter/material.dart';
import 'package:item_display_and_preorder_app/widgets/constants/color_constants.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({super.key, required this.text, required this.function});
  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
                colors: [AppColors.gradientFirst, AppColors.gradientLast]),
            boxShadow: [
              BoxShadow(
                  color: AppColors.secondary.withOpacity(0.9),
                  spreadRadius: 0.2,
                  blurRadius: 5)
            ]),
        child: TextButton(
          onPressed: function,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
