import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/view/widgets/build_cart_item.dart';
import 'package:ecommerce/view/widgets/build_custom_text_button.dart';
import 'package:ecommerce/view_model/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) {
          if (controller.cartsList!.isEmpty) {
            return Center(
              child: Image.asset(
                'assets/images/empty_cart.jpg',
                height: MediaQuery.of(context).size.height * 0.26,
                width: MediaQuery.of(context).size.width,
              ),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.cartsList!.length,
                    itemBuilder: (context, index) {
                      return buildCartItem(context, index: index);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                  ),
                ),
                if (controller.isTotalPrice >= 0)
                  buildCustomTextAndButton(
                    context,
                    text: 'total',
                    price: controller.isTotalPrice.toString(),
                    textButton: 'checkout',
                    onPressed: () => Get.toNamed(CheckOut),
                  ),
              ],
            );
          }
        },
      ),
    );
  }
}
