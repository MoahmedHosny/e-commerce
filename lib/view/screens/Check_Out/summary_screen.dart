import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_text_in_order.dart';
import 'package:ecommerce/view_model/cart_view_model.dart';
import 'package:ecommerce/view_model/check_out_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 15),
        child: Column(
          children: [
            GetBuilder<CartViewModel>(
              init: Get.find<CartViewModel>(),
              builder: (controller) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.228,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (ctx, index) =>
                      buildSummaryCart(ctx, controller.cartsList![index]),
                  separatorBuilder: (ctx, index) => const SizedBox(width: 10),
                  itemCount: controller.cartsList!.length,
                ),
              ),
            ),
            const SizedBox(height: 30),
            GetBuilder<CheckOutViewModel>(
              init: Get.find<CheckOutViewModel>(),
              builder: (controller) => Column(
                children: [
                  buildTextInOrder(
                    primaryText: 'Address : ',
                    text:
                        '${controller.street1Controller.text} , ${controller.street2Controller.text} , ${controller.cityController.text} , ${controller.stateController.text} , ${controller.countryController.text}',
                  ),
                  const SizedBox(height: 10),
                  buildTextInOrder(
                      primaryText: 'Delivery Time : ',
                      text: controller.value.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSummaryCart(ctx, CartModel cartModel) {
    var size = MediaQuery.of(ctx).size;
    return SizedBox(
      width: size.height * 0.16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.18,
            width: size.height * 0.18,
            child: Image.network(
              cartModel.image!,
            ),
          ),
          const SizedBox(height: 4),
          buildCustomText(
            text: cartModel.title!,
            fontSize: 16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          buildCustomText(
            text: '\$ ${cartModel.price!}',
            color: green,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
