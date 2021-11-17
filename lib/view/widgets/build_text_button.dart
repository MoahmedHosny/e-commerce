import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:flutter/material.dart';

Widget buildTextButton({
  required VoidCallback onTap,
  required String text,
}) {
  return GestureDetector(
    onTap: onTap,
    child: buildCustomText(
      text: text,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: blue,
    ),
  );
}
