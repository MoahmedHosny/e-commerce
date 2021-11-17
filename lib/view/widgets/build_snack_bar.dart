import 'package:ecommerce/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void buildSnackBar({
  required String title,
  required String msg,
}) {
  return Get.snackbar(
    title,
    msg,
    messageText: Text(
      msg,
      style: GoogleFonts.lato(
        fontWeight: FontWeight.bold,
        color: black.withOpacity(0.8),
      ),
    ),
    borderRadius: 4,
    duration: const Duration(seconds: 2),
    //  snackPosition: SnackPosition.BOTTOM,
  );
}
