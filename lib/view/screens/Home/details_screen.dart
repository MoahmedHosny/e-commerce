import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/model/favorite_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_available_colors.dart';
import 'package:ecommerce/view/widgets/build_available_sizes.dart';
import 'package:ecommerce/view/widgets/build_custom_container.dart';
import 'package:ecommerce/view/widgets/build_category_circular.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_custom_text_button.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:ecommerce/view_model/cart_view_model.dart';
import 'package:ecommerce/view_model/favorite_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.productModel}) : super(key: key);
  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.324,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            height: size.height * 0.30,
                            width: size.width,
                            child: CachedNetworkImage(
                              imageUrl: productModel.image.toString(),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  color: btn.withOpacity(0.45),
                                  image: DecorationImage(
                                    image: imageProvider,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => buildIcon(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GetBuilder<FavoriteViewModel>(
                            init: FavoriteViewModel(),
                            builder: (controller) => GestureDetector(
                              onTap: () {
                                Get.back();
                                controller.addProductToFav(
                                  FavoriteModel(
                                    title: productModel.title,
                                    productId: productModel.productId,
                                    image: productModel.image,
                                    price: productModel.price,
                                  ),
                                );
                              },
                              child: buildCategoryCircular(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  'assets/images/icons/wishlist.png',
                                  scale: 1.8,
                                  color: yellow,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildCustomText(
                          text: productModel.title.toString(),
                          fontSize: 20,
                          height: 1.4,
                        ),
                        const SizedBox(height: 20),
                        if (productModel.sizes != null)
                          const CustomContainer(text: 'Size'),
                        if (productModel.sizes != null)
                          const SizedBox(height: 10),
                        if (productModel.sizes != null)
                          AvailableSizes(sizes: productModel.sizes),
                        const SizedBox(height: 15),
                        const CustomContainer(text: 'Color'),
                        const SizedBox(height: 10),
                        AvailableColors(colors: productModel.colors),
                        const SizedBox(height: 20),
                        buildCustomText(
                            text: 'Details', fontSize: 20, letterSpacing: 1),
                        const SizedBox(height: 10),
                        Text(
                          productModel.description.toString().toLowerCase(),
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            color: black.withOpacity(0.65),
                            height: 1.55,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GetBuilder<CartViewModel>(
            init: CartViewModel(),
            builder: (controller) {
              return buildCustomTextAndButton(
                context,
                text: 'price',
                price: productModel.price.toString(),
                textButton: 'add',
                onPressed: () {
                  Get.back();
                  controller.addProductToCart(
                    CartModel(
                      productId: productModel.productId,
                      title: productModel.title,
                      image: productModel.image,
                      price: productModel.price,
                      quantity: 1,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
