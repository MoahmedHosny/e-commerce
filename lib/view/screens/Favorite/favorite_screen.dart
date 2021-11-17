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
          return Center(
            child: Image.asset(
              'assets/images/empty_fav.jpg',
              height: MediaQuery.of(context).size.height * 0.26,
              width: MediaQuery.of(context).size.width,
            ),
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
