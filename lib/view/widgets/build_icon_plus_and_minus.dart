import 'package:ecommerce/styles/colors/colors.dart';
import 'package:flutter/material.dart';

Widget buildIconPlusAndMinus({
  IconData? icon,
  required VoidCallback onTap,
  double? radius,
  double? size,
}) {
  return GestureDetector(
    onTap: onTap,
    child: CircleAvatar(
      radius: radius ?? 16,
      backgroundColor: btn.withOpacity(0.45),
      child: Icon(icon ?? Icons.add, size: size ?? 18, color: black),
    ),
  );
}
