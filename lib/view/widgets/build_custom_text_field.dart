import 'package:google_fonts/google_fonts.dart';
import '../../styles/colors/colors.dart';
import 'package:flutter/material.dart';

Widget buildCustomTextField({
  String? hintText,
  String? labelText,
  required TextEditingController controller,
  required TextInputType type,
  required Function(String? value) onChanged,
  required Function(String? value) onSaved,
  FormFieldValidator? validator,
  InputBorder? border,
  bool? isPassword = false,
}) {
  return TextFormField(
    style: const TextStyle(fontSize: 16.75, height: 1.6, letterSpacing: 0.25),
    cursorColor: black,
    controller: controller,
    keyboardType: type,
    onChanged: onChanged,
    onSaved: onSaved,
    validator: validator,
    obscureText: isPassword!,
    decoration: InputDecoration(
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(color: green),
      border: border,
      hintStyle: GoogleFonts.lato(
        fontSize: 16,
        color: black.withOpacity(0.6),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: black.withOpacity(0.4),
          width: 0.8,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: green,
          width: 0.8,
        ),
      ),
    ),
  );
}
