import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_button.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:flutter/material.dart';

Widget buildCustomTextAndButton(
  BuildContext context, {
  required String text,
  required String price,
  required String textButton,
  required VoidCallback onPressed,
}) {
  var size = MediaQuery.of(context).size;
  return Container(
    padding: const EdgeInsets.only(top: 6, left: 10, right: 10),
    height: size.height * 0.064,
    width: size.width,
    decoration: BoxDecoration(
      color: white,
      boxShadow: [
        BoxShadow(
          color: grey.withOpacity(0.6),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCustomText(
                  text: text.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  color: grey.withOpacity(0.6),
                ),
                const SizedBox(height: 6),
                buildCustomText(
                  text: '\$ $price',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ],
            ),
            const Spacer(),
            buildCustomButton(
              text: textButton,
              width: size.width * 0.40,
              onPressed: onPressed,
            )
          ],
        ),
      ],
    ),
  );
}
