import 'package:ecommerce/model/order_model.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_circular_loading.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_dialog.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:ecommerce/view/widgets/build_text_button.dart';
import 'package:ecommerce/view/widgets/build_text_in_order.dart';
import 'package:ecommerce/view_model/check_out_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          splashRadius: 25,
          icon: buildIcon(
            icon: Icons.arrow_back_rounded,
            color: black,
            size: 22,
          ),
        ),
        title: Row(
          children: [
            buildCustomText(
              text: 'Order',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: black,
            ),
            buildCustomText(
              text: ' History',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: green,
            ),
          ],
        ),
      ),
      body: GetBuilder<CheckOutViewModel>(
        init: CheckOutViewModel(),
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: controller.orders.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildIcon(),
                    const SizedBox(height: 10),
                    buildCustomText(
                      text: 'There are no orders yet !',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                    ),
                  ],
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return buildOrderItem(
                          context, controller.orders[index], index);
                    },
                    separatorBuilder: (ctx, index) => const SizedBox(height: 6),
                    itemCount: controller.orders.length,
                  ),
                ),
        ),
      ),
    );
  }

  Widget buildOrderItem(context, OrderModel orderModel, int index) {
    CheckOutViewModel controller = Get.find<CheckOutViewModel>();
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextInOrder(
                    primaryText: 'Address : ',
                    text:
                        '${orderModel.street1} , ${orderModel.street2} , ${orderModel.city} , ${orderModel.state} , ${orderModel.country}',
                  ),
                  const SizedBox(height: 10),
                  buildTextInOrder(
                    primaryText: 'Delivery Time : ',
                    text: orderModel.deliveryTime.toString(),
                  ),
                  const SizedBox(height: 10),
                  buildTextInOrder(
                    primaryText: 'Price : ',
                    text: '\$ ${orderModel.isTotalPrice}',
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.186,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: yellow.withOpacity(0.65),
                    ),
                    child: buildCustomText(
                      text: orderModel.deliveryType.toString(),
                      fontWeight: FontWeight.bold,
                      color: white,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                buildDialog(
                  context,
                  title: 'Delete Order',
                  text: 'Do you want to delete this order from\nyour orders ?',
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        buildTextButton(
                            text: 'CANCEL', onTap: () => Get.back()),
                        const SizedBox(width: 30),
                        buildTextButton(
                          text: 'DELETE',
                          onTap: () {
                            Get.back();
                            controller.deleteOrder(orderModel, index);
                          },
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                );
              },
              splashRadius: 20,
              icon: buildIcon(
                icon: Icons.delete,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
