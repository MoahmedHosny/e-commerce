import 'package:ecommerce/view/widgets/build_category_item.dart';
import 'package:ecommerce/view/widgets/build_circular_loading.dart';
import 'package:ecommerce/view/widgets/build_product_item.dart';
import 'package:ecommerce/view/widgets/buid_search_form_field.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.isLoading.value
          ? buildCircularLoading()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    buildSearchFormField(),
                    const SizedBox(height: 30),
                    buildCustomText(
                        text: 'Categories', fontSize: 20, letterSpacing: 1),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.category.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 15),
                        itemBuilder: (context, index) =>
                            buildCategoryItem(controller.category[index]),
                      ),
                    ),
                    const SizedBox(height: 25),
                    buildCustomText(
                        text: 'All Products', fontSize: 20, letterSpacing: 1),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3.34,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) => buildProductItem(
                            context, controller.products[index]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
