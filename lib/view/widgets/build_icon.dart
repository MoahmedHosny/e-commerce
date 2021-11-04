import 'package:ecommerce/styles/colors/colors.dart';
import 'package:flutter/material.dart';

Widget buildIcon({
  IconData? icon,
  double? size,
  Color? color,
}) {
  return Icon(
    icon ?? Icons.error,
    color: color ?? red,
    size: size ?? 30,
  );
}
