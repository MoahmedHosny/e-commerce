import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key, this.text}) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.038,
      width: MediaQuery.of(context).size.height * 0.066,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.circular(2),
      ),
      child: buildCustomText(
        text: text!,
        fontSize: 18,
        color: white,
        alignment: Alignment.center,
        letterSpacing: 1,
      ),
    );
  }
}
