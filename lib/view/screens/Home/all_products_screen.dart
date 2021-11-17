import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/screens/Home/details_screen.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:ecommerce/view/widgets/build_product_item.dart';
import 'package:ecommerce/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => Scaffold(
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
          title: buildCustomText(text: 'Products', fontWeight: FontWeight.bold),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 4,
              crossAxisSpacing: 15,
              mainAxisSpacing: 5,
            ),
            itemCount: controller.products.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Get.to(() =>
                  DetailsScreen(productModel: controller.products[index])),
              child: buildProductItem(
                context,
                controller.products[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
