import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_favorite_item.dart';
import 'package:ecommerce/view_model/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteViewModel>(
      init: FavoriteViewModel(),
      builder: (controller) {
        if (controller.favList!.isEmpty) {
          return buildCustomText(
            text: 'Favorite Empty . .',
            fontSize: 30,
            alignment: Alignment.center,
          );
        } else {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildFavoriteItem(context, index: index),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: controller.favList!.length,
          );
        }
      },
    );
  }
}
