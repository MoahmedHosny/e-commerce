import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_category_item.dart';
import 'package:ecommerce/view/widgets/build_circular_loading.dart';
import 'package:ecommerce/view/widgets/build_product_item.dart';
import 'package:ecommerce/view/widgets/build_search_form_field.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.isLoading.value
          ? buildCircularLoading()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    buildSearchFormField(),
                    const SizedBox(height: 30),
                    buildCustomText(
                      text: 'Categories',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          controller.category.length,
                          (index) => buildCategoryItem(
                            controller.category[index],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        buildCustomText(
                          text: 'Best Selling',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Get.toNamed(AllProducts),
                          child: buildCustomText(
                            text: 'See all',
                            fontSize: 15,
                            color: grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 4,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) => buildProductItem(
                        context,
                        controller.products[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
