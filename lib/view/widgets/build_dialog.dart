import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void buildDialog(
  BuildContext context, {
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
            title: buildCustomText(text: 'Delete Product'),
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            content: Text(
              text,
              style: GoogleFonts.lato(
                  fontSize: 16, color: black.withOpacity(0.65)),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            actions: actions,
          ),
        ],
      );
    },
  );
}
