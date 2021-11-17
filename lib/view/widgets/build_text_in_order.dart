import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:flutter/material.dart';

Widget buildTextInOrder({
  required String primaryText,
  required String text,
   Color? color,
  FontWeight? fontWeight,
}) {
  return Row(
    children: [
      buildCustomText(
        text: primaryText,
        fontSize: 16,
        color: black,
        fontWeight: FontWeight.bold,
      ),
      Expanded(
        child: buildCustomText(
          text: text,
          fontSize: 16,
          fontWeight: fontWeight,
          color: color ?? black,
        ),
      ),
    ],
  );
}
