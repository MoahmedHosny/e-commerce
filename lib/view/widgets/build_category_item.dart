import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_category_circular.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget buildCategoryItem(CategoryModel categoryModel) {
  return Column(
    children: [
      buildCategoryCircular(
        child: CachedNetworkImage(
          imageUrl: categoryModel.image.toString(),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                scale: 1.8,
              ),
            ),
          ),
          errorWidget: (context, url, error) => buildIcon(size: 22),
        ),
      ),
      const SizedBox(height: 15),
      buildCustomText(
        text: categoryModel.name.toString(),
      ),
    ],
  );
}
