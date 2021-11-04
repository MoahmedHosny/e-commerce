import 'package:ecommerce/styles/colors/colors.dart';
import 'package:flutter/material.dart';

Widget buildCategoryCircular({
  double? height,
  double? width,
  required Widget child,
}) {
  return Container(
    height: height ?? 70,
    width: width ?? 70,
    decoration: BoxDecoration(
      color: white,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: lightGrey.withOpacity(0.2),
          blurRadius: 10,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: child,
  );
}
