import '../../styles/colors/colors.dart';
import 'package:flutter/material.dart';

import 'build_custom_text.dart';

Widget buildCustomButton({
  required String text,
  required double width,
  required VoidCallback onPressed,
  double? height,
  Color? backColor,
  Color? borderColor,
  Color? textColor,
  Alignment? alignment,
}) {
  return Container(
    height: height ?? 40,
    alignment: alignment,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      border: Border.all(
        color: borderColor ?? transparent,
        width: 0.8,
      ),
    ),
    child: MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      onPressed: onPressed,
      color: backColor ?? green,
      height: height ?? 40,
      minWidth: width,
      child: buildCustomText(
        text: text.toUpperCase(),
        alignment: Alignment.center,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textColor ?? white,
      ),
    ),
  );
}
