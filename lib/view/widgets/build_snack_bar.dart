import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void buildSnackBar({
  required String title,
  required String msg,
  Color? color,
}) {
  return Get.snackbar(
    title,
    msg,
    titleText:
        buildCustomText(text: title, fontWeight: FontWeight.bold, color: white),
    messageText: buildCustomText(
      text: msg,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: white,
    ),
    borderRadius: 4,
    backgroundColor: color ?? green,
    duration: const Duration(seconds: 2),
    //  snackPosition: SnackPosition.BOTTOM,
  );
}
