import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/styles/icons/icon_broken.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildSearchFormField() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: btn.withOpacity(0.25),
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextFormField(
      cursorColor: black,
      style: const TextStyle(height: 1.4),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search now . . .',
        hintStyle: TextStyle(color: black.withOpacity(0.55), letterSpacing: 1),
        prefixIcon: buildIcon(
          icon: Icons.search,
          size: 24,
          color: black.withOpacity(0.55),
        ),
      ),
    ),
  );
}
