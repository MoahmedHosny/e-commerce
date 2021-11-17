import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableSizes extends StatelessWidget {
  const AvailableSizes({Key? key, this.sizes}) : super(key: key);
  final List<dynamic>? sizes;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.038,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: yellow.withOpacity(0.65),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: buildCustomText(
                text: sizes![index].toString(),
                fontWeight: FontWeight.bold,
                color: white,
                alignment: Alignment.center,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 6),
        itemCount: sizes!.length,
      ),
    );
  }
}
