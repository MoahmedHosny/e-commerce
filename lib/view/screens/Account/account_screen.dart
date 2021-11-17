import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:ecommerce/view/widgets/build_list_tile_item.dart';
import 'package:ecommerce/view/widgets/build_circular_loading.dart';
import 'package:ecommerce/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (controller) => controller.isLoading.value
          ? buildCircularLoading()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 64,
                        backgroundColor: green.withOpacity(0.08),
                        child: CachedNetworkImage(
                          imageUrl: controller.userDataModel!.image.toString(),
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            radius: 64,
                            backgroundImage: imageProvider,
                          ),
                          placeholder: (context, url) =>
                              buildCircularLoading(strokeWidth: 2.0),
                          errorWidget: (context, url, error) => buildIcon(),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildCustomText(
                              text: controller.userDataModel!.name.toString(),
                              fontSize: 16.5,
                              fontWeight: FontWeight.bold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            buildCustomText(
                              text: controller.userDataModel!.email
                                          .toString() ==
                                      null.toString()
                                  ? 'There is no email ...'
                                  : controller.userDataModel!.email.toString(),
                              color: grey.withOpacity(0.8),
                              fontSize: 15.5,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
                buildListTileItem(
                  image: 'assets/images/icons/edit.png',
                  text: 'Edit Profile',
                  onTap: () => Get.toNamed(EditProfile),
                ),
                const SizedBox(height: 10),
                buildListTileItem(
                  image: 'assets/images/icons/location.png',
                  text: 'Shipping Address',
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                buildListTileItem(
                  image: 'assets/images/icons/history.png',
                  text: 'Order History',
                  onTap: () => Get.toNamed(OrderHistory),
                ),
                const SizedBox(height: 10),
                buildListTileItem(
                  image: 'assets/images/icons/card.png',
                  text: 'Cards',
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                buildListTileItem(
                  image: 'assets/images/icons/notification.png',
                  text: 'Notifications',
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                buildListTileItem(
                  image: 'assets/images/icons/logout.png',
                  text: 'Log Out',
                  trailing: const SizedBox(),
                  onTap: () {
                    controller.signOut();
                  },
                ),
              ],
            ),
    );
  }
}
