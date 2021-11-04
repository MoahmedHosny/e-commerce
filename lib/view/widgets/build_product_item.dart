import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/screens/Home/details_screen.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:ecommerce/view/widgets/build_circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'build_custom_text.dart';

Widget buildProductItem(BuildContext context, ProductModel productModel) {
  var size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () => Get.to(() => DetailsScreen(productModel: productModel)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.26,
          width: size.width,
          child: CachedNetworkImage(
            imageUrl: productModel.image.toString(),
            imageBuilder: (context, imageProvider) => Container(
              height: size.height * 0.26,
              width: size.width,
              decoration: BoxDecoration(
                color: btn.withOpacity(0.45),
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) =>
                buildCircularLoading(strokeWidth: 2.0),
            errorWidget: (context, url, error) => buildIcon(),
          ),
        ),
        const SizedBox(height: 10),
        buildCustomText(
          text: productModel.title.toString(),
          fontSize: 16,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        buildCustomText(
          text: '\$ ${productModel.price}',
          fontSize: 16,
          color: green,
        ),
      ],
    ),
  );
}
