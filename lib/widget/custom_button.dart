import 'package:calc/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isOperator;
  final String buttonText;
  final Function() onTap;

  // barcha fieldlarni kiritish majburiy qilamiz yoddan ko'tarilmasligi uchun
  const CustomButton({
    super.key,
    required this.isOperator,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          color: isOperator
              ? AppColors.operatorButtonColor
              : AppColors.buttonColor,
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
