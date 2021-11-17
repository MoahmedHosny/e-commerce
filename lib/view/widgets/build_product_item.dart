import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:ecommerce/view/widgets/build_circular_loading.dart';
import 'package:flutter/material.dart';
import 'build_custom_text.dart';

Widget buildProductItem(BuildContext context, ProductModel productModel) {
  var size = MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: size.height * 0.30,
        width: size.width,
        child: CachedNetworkImage(
          imageUrl: productModel.image.toString(),
          imageBuilder: (context, imageProvider) => Container(
            height: size.height * 0.30,
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
          placeholder: (context, url) => buildCircularLoading(strokeWidth: 2.0),
          errorWidget: (context, url, error) => buildIcon(),
        ),
      ),
      const SizedBox(height: 10),
      buildCustomText(
        text: productModel.title.toString(),
        fontSize: 16,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 4),
      buildCustomText(
        text: productModel.description.toString().toLowerCase(),
        fontSize: 15,
        color: grey.withOpacity(0.65),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 6),
      buildCustomText(
        text: '\$ ${productModel.price}',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: green,
      ),
    ],
  );
}
