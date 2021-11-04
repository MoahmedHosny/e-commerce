import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:flutter/material.dart';

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
              color: btn.withOpacity(0.45),
              borderRadius: BorderRadius.circular(2),
            ),
            child: buildCustomText(
              text: sizes![index].toString(),
              fontSize: 15.22,
              alignment: Alignment.center,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: sizes!.length,
      ),
    );
  }
}
