import 'package:ecommerce/styles/colors/colors.dart';
import 'package:flutter/material.dart';

Widget buildDismissible({
  required Key key,
  required Widget child,
  required Function(DismissDirection direction)? onDismissed,
}) {
  return Dismissible(
    key: key,
    child: child,
    direction: DismissDirection.startToEnd,
    onDismissed: onDismissed,
    background: Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      color: red,
      alignment: Alignment.centerLeft,
      child: Image.asset(
        'assets/images/icons/remove.png',
        scale: 1.6,
      ),
    ),
  );
}
