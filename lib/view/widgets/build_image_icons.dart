import 'package:flutter/material.dart';

Widget buildImageIcons({
  required String image,
  double? scale,
}) {
  return Image.asset(
    image,
    scale: scale ?? 2.2,
  );
}
