import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_image_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildListTileItem({
  required String image,
  required String text,
  required VoidCallback onTap,
  Widget? trailing,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 14),
    leading: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF70FFBD).withOpacity(0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: buildImageIcons(image: image),
    ),
    title: Text(
      text,
      style: GoogleFonts.lato(fontSize: 16.88, fontWeight: FontWeight.bold),
    ),
    trailing: trailing ??
        Image.asset(
          'assets/images/icons/arrow.png',
          scale: 1.7,
        ),
    onTap: onTap,
  );
}
