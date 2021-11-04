import '../../styles/colors/colors.dart';
import 'package:flutter/material.dart';

import 'build_custom_text.dart';

Widget buildCustomButton({
  required String text,
  required double width,
  required VoidCallback onPressed,
  double? height,
}) {
  return MaterialButton(
    elevation: 5,
    highlightElevation: 5,
    onPressed: onPressed,
    color: green,
    height: height ?? 40,
    minWidth: width,
    child: buildCustomText(
      text: text.toUpperCase(),
      alignment: Alignment.center,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: white,
    ),
  );
}
