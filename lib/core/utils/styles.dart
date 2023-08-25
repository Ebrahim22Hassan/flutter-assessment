import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static TextStyle textStyle14(FontWeight fontWeight) => GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: fontWeight,
      );
  static TextStyle textStyle16(Color color) => GoogleFonts.raleway(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
      );
}
