import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_dialog.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:ecommerce/view/widgets/build_icon_plus_and_minus.dart';
import 'package:ecommerce/view/widgets/build_circular_loading.dart';
import 'package:ecommerce/view/widgets/build_text_button.dart';
import 'package:ecommerce/view_model/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildCartItem(BuildContext context, {required int index}) {
  var size = MediaQuery.of(context).size;
  return GetBuilder<CartViewModel>(
    init: CartViewModel(),
    builder: (controller) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: size.height * 0.132,
        child: Row(
          children: [
            SizedBox(
              height: size.height * 0.132,
              width: size.width * 0.295,
              child: CachedNetworkImage(
                imageUrl: controller.cartsList![index].image.toString(),
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
                    text: controller.cartsList![index].title.toString(),
                    fontSize: 17,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  buildCustomText(
                    text: '\$ ${controller.cartsList![index].price}',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                  const Spacer(),
                  Container(
                    height: size.height * 0.035,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                      color: btn.withOpacity(0.45),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildIconPlusAndMinus(
                          onTap: () => controller.incrementQuantity(index),
                          icon: Icons.add,
                        ),
                        buildCustomText(
                          text:
                              controller.cartsList![index].quantity.toString(),
                          fontSize: 20,
                        ),
                        buildIconPlusAndMinus(
                          onTap: () {
                            if (controller.cartsList![index].quantity <= 1) {
                              controller.removeProductFromCart(
                                  id: controller.cartsList![index].id!,
                                  index: index);
                            } else {
                              controller.decrementQuantity(index);
                            }
                          },
                          icon: Icons.remove,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                buildDialog(
                  context,
                  text: 'Do you want to delete this product from\nyour cart ?',
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        buildTextButton(
                            text: 'CANCEL', onTap: () => Get.back()),
                        const SizedBox(width: 20),
                        buildTextButton(
                          text: 'DELETE',
                          onTap: () {
                            Get.back();
                            controller.removeProductFromCart(
                              id: controller.cartsList![index].id!,
                              index: index,
                            );
                          },
                        ),
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
