import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/utils/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.textColor,
  });
  final void Function()? onPressed;
  final String text;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.textStyle16(textColor),
      ),
    );
  }
}
