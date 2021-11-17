import 'package:google_fonts/google_fonts.dart';
import '../../styles/colors/colors.dart';
import 'package:flutter/material.dart';

Widget buildCustomTextField({
  String? hintText,
  String? labelText,
  TextEditingController? controller,
  TextInputType? type,
  Function(String? value)? onChanged,
  Function(String? value)? onSaved,
  FormFieldValidator? validator,
  InputBorder? border,
  bool? isPassword = false,
  Color? color,
}) {
  return TextFormField(
    style: GoogleFonts.merriweatherSans(
      color: black,
    ),
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
      labelStyle:  TextStyle(color: color ?? green),
      border: border,
      hintStyle: GoogleFonts.merriweatherSans(
        color: grey,
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
