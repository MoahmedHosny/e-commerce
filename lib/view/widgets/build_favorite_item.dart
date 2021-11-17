import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_circular_loading.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_dialog.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:ecommerce/view/widgets/build_text_button.dart';
import 'package:ecommerce/view_model/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildFavoriteItem(BuildContext context, {required int index}) {
  var size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: GetBuilder<FavoriteViewModel>(
      init: FavoriteViewModel(),
      builder: (controller) => SizedBox(
        height: size.height * 0.132,
        child: Row(
          children: [
            SizedBox(
              height: size.height * 0.132,
              width: size.width * 0.295,
              child: CachedNetworkImage(
                imageUrl: '${controller.favList![index].image}',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    color: btn.withOpacity(0.45),
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: imageProvider,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    buildCircularLoading(strokeWidth: 2.0),
                errorWidget: (context, url, error) => buildIcon(),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCustomText(
                    text: controller.favList![index].title.toString(),
                    fontSize: 17,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  buildCustomText(
                    text: '\$ ${controller.favList![index].price}',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                buildDialog(
                  context,
                  text:
                      'Do you want to delete this product from\nyour favorite ?',
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        buildTextButton(text: 'NO', onTap: () => Get.back()),
                        const SizedBox(width: 30),
                        buildTextButton(
                          text: 'YES',
                          onTap: () {
                            Get.back();
                            controller.removeProductFromFav(
                              id: controller.favList![index].id!,
                              index: index,
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                );
              },
              splashRadius: 25,
              icon: buildIcon(icon: Icons.delete, size: 22),
            ),
          ],
        ),
      ),
    ),
  );
}
