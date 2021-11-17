import 'package:ecommerce/styles/colors/colors.dart';
import 'package:flutter/material.dart';

Widget buildIconPlusAndMinus({
  IconData? icon,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Icon(
      icon,
      size: 18,
    ),
  );
}
