import 'dart:io';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_circular_loading.dart';
import 'package:ecommerce/view/widgets/build_custom_button.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_custom_text_field.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:ecommerce/view/widgets/build_icon_plus_and_minus.dart';
import 'package:ecommerce/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: Get.find<AuthViewModel>(),
      builder: (controller) {
        controller.getUserDataInFields();
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
                    text: 'EDIT', fontWeight: FontWeight.bold, color: black),
                buildCustomText(
                  text: ' PROFILE',
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: green.withOpacity(0.2),
                        child: CircleAvatar(
                          radius: 66,
                          backgroundColor: white,
                          backgroundImage: controller.imageProfile == null
                              ? NetworkImage(controller.userDataModel!.image
                                  .toString()) as ImageProvider
                              : FileImage(controller.imageProfile as File),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4, bottom: 4),
                        child: buildIconPlusAndMinus(
                          onTap: () => controller.getImageProfile(),
                          radius: 20,
                          icon: Icons.camera_alt_rounded,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  buildCustomTextField(
                    labelText: 'User Name',
                    controller: controller.nameUpdateCon,
                    type: TextInputType.name,
                    onChanged: (value) {
                      controller.nameUpdate = value!;
                    },
                    onSaved: (value) {
                      controller.nameUpdate = value!;
                    },
                  ),
                  const SizedBox(height: 10),
                  buildCustomTextField(
                    labelText: 'E-mail',
                    controller: controller.emailUpdateCon,
                    type: TextInputType.emailAddress,
                    onChanged: (value) {
                      controller.emailUpdate = value!;
                    },
                    onSaved: (value) {
                      controller.emailUpdate = value!;
                    },
                  ),
                  const SizedBox(height: 10),
                  buildCustomTextField(
                    labelText: 'Phone Number',
                    controller: controller.phoneNumberUpdateCon,
                    type: TextInputType.phone,
                    onChanged: (value) {
                      controller.phoneNumberUpdate = value!;
                    },
                    onSaved: (value) {
                      controller.phoneNumberUpdate = value!;
                    },
                  ),
                  const SizedBox(height: 10),
                  buildCustomTextField(
                    labelText: 'Address',
                    controller: controller.addressUpdateCon,
                    type: TextInputType.text,
                    onChanged: (value) {
                      controller.addressUpdate = value!;
                    },
                    onSaved: (value) {
                      controller.addressUpdate = value!;
                    },
                  ),
                  const SizedBox(height: 30),
                  controller.isLoading.value
                      ? buildCircularLoading()
                      : buildCustomButton(
                          text: 'update',
                          width: MediaQuery.of(context).size.width,
                          onPressed: () => controller.updateUserData(),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
