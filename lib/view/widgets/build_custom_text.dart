import 'package:flutter/material.dart';

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
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
      ),
    ),
  );
}
