import 'package:flutter/cupertino.dart';
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
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2,
      ),
    ),
    borderRadius: 4.0,
    duration: const Duration(seconds: 2),
    //  snackPosition: SnackPosition.BOTTOM,
  );
}
