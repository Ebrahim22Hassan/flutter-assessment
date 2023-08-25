import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.onPressed,
      required this.text,
      required this.buttonColor,
      required this.textColor,
      this.fontWeight})
      : super(key: key);
  final void Function()? onPressed;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: textColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.raleway(fontSize: 12, fontWeight: fontWeight),
      ),
    );
  }
}
