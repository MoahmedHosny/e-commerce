import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_button.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:flutter/material.dart';

Widget buildCustomTextAndButton(
  BuildContext context, {
  required String text,
  required String price,
  required String textButton,
  required VoidCallback? onPressed,
}) {
  var size = MediaQuery.of(context).size;
  return Container(
    padding: const EdgeInsets.only(top: 4, left: 10, right: 10),
    height: size.height * 0.066,
    width: size.width,
    decoration: BoxDecoration(
      color: white,
      boxShadow: [
        BoxShadow(
          color: lightGrey.withOpacity(0.8),
          blurRadius: 16,
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
                  fontSize: 16,
                  color: black.withOpacity(0.3),
                ),
                buildCustomText(
                  text: '\$ $price',
                  fontSize: 16.5,
                  letterSpacing: 0.2,
                  color: green,
                ),
              ],
            ),
            const Spacer(),
            buildCustomButton(
              text: textButton,
              width: size.width * 0.40,
              onPressed: onPressed!,
            )
          ],
        ),
      ],
    ),
  );
}
