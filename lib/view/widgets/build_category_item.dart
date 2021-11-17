import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

Widget buildCategoryItem(CategoryModel categoryModel) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          if (categoryModel.id == 0) {
            Get.toNamed(Men);
          } else if (categoryModel.id == 1) {
            Get.toNamed(Women);
          } else if (categoryModel.id == 2) {
            Get.toNamed(Gadgets);
          } else if (categoryModel.id == 3) {
            Get.toNamed(Devices);
          } else {
            Get.toNamed(Gaming);
          }
        },
        child: Container(
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
      ),
      const SizedBox(height: 10),
      Text(
        categoryModel.name.toString(),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
