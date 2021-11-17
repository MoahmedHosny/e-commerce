import 'package:ecommerce/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildCustomText({
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  Alignment? alignment,
  int? maxLines,
  TextOverflow? overflow,
  double? letterSpacing,
  double? height,
}) {
  return Align(
    alignment: alignment ?? Alignment.centerLeft,
    child: Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.merriweatherSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? black,
        letterSpacing: letterSpacing,
        height: height,
      ),
    ),
  );
}
