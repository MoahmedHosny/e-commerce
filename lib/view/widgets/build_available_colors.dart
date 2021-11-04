import 'package:flutter/material.dart';

class AvailableColors extends StatelessWidget {
  AvailableColors({Key? key, this.colors}) : super(key: key);
  List<Color>? colors;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CircleAvatar(
            radius: 12,
            backgroundColor: colors![index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: colors!.length,
      ),
    );
  }
}
