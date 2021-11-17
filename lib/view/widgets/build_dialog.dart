import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:flutter/material.dart';

void buildDialog(
  BuildContext context, {
  String? title,
  required String text,
  required List<Widget> actions,
}) {
  showDialog(
    context: context,
    useSafeArea: false,
    barrierDismissible: false,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            title: buildCustomText(
              text: title ?? 'Delete Product',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            titlePadding: const EdgeInsets.all(10),
            content: buildCustomText(
              text: text,
              fontSize: 16,
              color: grey,
            ),
            contentPadding: const EdgeInsets.all(10),
            actions: actions,
            actionsPadding: const EdgeInsets.only(bottom: 4),
          ),
        ],
      );
    },
  );
}
