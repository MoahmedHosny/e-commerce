import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void buildSnackBar({
  required String title,
  required String msg,
}) {
  return Get.snackbar(
    title,
    msg,
    titleText: buildCustomText(text: title, fontWeight: FontWeight.bold),
    messageText: buildCustomText(
      text: msg,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: black.withOpacity(0.8),
    ),
    borderRadius: 4,
    duration: const Duration(seconds: 2),
    //  snackPosition: SnackPosition.BOTTOM,
  );
}
