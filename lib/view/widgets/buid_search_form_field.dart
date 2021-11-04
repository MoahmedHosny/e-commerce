import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/styles/icons/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildSearchFormField() {
  return Container(
    padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
    margin: const EdgeInsetsDirectional.only(end: 10),
    decoration: BoxDecoration(
      color: btn.withOpacity(0.2),
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextFormField(
      cursorColor: black,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search now . . .',
        hintStyle: TextStyle(color: grey.withOpacity(0.6), letterSpacing: 0.4),
        prefixIcon: const Icon(
          IconBroken.Search,
          color: black,
          size: 22,
        ),
      ),
    ),
  );
}
