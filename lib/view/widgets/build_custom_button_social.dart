import '../../styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'build_custom_text.dart';

Widget buildCustomButtonSocial({
  required String image,
  required String text,
  required VoidCallback onPressed,
}) {
  return MaterialButton(
    elevation: 5,
    highlightElevation: 5,
    highlightColor: white,
    onPressed: onPressed,
    color: white,
    height: 40,
    child: Row(
      children: [
        const SizedBox(width: 40),
        Image.asset(
          image,
          width: 25,
          height: 25,
        ),
        const SizedBox(width: 60),
        buildCustomText(text: text, fontSize: 14, fontWeight: FontWeight.bold),
      ],
    ),
  );
}
