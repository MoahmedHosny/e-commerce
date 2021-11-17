import 'package:ecommerce/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AvailableColors extends StatelessWidget {
  const AvailableColors({Key? key, this.colors}) : super(key: key);
  final List<dynamic>? colors;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return CircleAvatar(
            radius: 16,
            backgroundColor: black,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: HexColor('${colors![index]}'),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 4),
        itemCount: colors!.length,
      ),
    );
  }
}
