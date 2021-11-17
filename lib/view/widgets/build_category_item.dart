import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget buildCategoryItem(CategoryModel categoryModel) {
  return Column(
    children: [
      Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: white,
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: CachedNetworkImage(
          imageUrl: categoryModel.image.toString(),
          imageBuilder: (context, imageProvider) => Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                scale: 1.86,
              ),
            ),
          ),
          errorWidget: (context, url, error) => buildIcon(size: 20),
        ),
      ),
      const SizedBox(height: 10),
      Text(
        categoryModel.name.toString(),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
