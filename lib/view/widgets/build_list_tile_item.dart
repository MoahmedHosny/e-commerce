import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:flutter/material.dart';

Widget buildListTileItem({
  required String image,
  required String text,
  required VoidCallback onTap,
  Widget? trailing,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
    leading: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF70FFBD).withOpacity(0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Image.asset(
        image,
        scale: 2.2,
      ),
    ),
    title: buildCustomText(text: text , ),
    trailing: trailing ??
        Image.asset(
          'assets/images/icons/arrow.png',
          scale: 1.75,
        ),
    onTap: onTap,
  );
}
