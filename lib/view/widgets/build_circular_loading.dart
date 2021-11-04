import 'package:ecommerce/styles/colors/colors.dart';
import 'package:flutter/material.dart';

Widget buildCircularLoading({
  Color? color,
  double? strokeWidth,
}) {
  return Center(
    child: CircularProgressIndicator(
      color: color ?? green,
      strokeWidth: strokeWidth ?? 3.0,
    ),
  );
}
