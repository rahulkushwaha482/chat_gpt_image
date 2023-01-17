import 'package:flutter/material.dart';
import '../constant/app_theme.dart';

class ElevatedButtonText extends StatelessWidget {
  final String buttonText;
  final dynamic onPressed;
  final double? buttonHorizontalPadding;
  final double? buttonPadding;
  final double? borderRadius;
   bool inProgress;

   ElevatedButtonText({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonHorizontalPadding,
    this.buttonPadding,
    this.borderRadius,
    required this.inProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: buttonHorizontalPadding ?? 35.0,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.kGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius??10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(buttonPadding ?? 5),
          child: Center(
            child: (inProgress)?const SizedBox(
              height: 20,
                width: 20,

                child:  CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppTheme.kWhite,
                )):Text(
              buttonText,
              style: const  TextStyle(
                fontSize: 14
              )
            ),
          ),
        ),
      ),
    );
  }
}
