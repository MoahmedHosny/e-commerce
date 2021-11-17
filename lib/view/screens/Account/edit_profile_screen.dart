import 'dart:io';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_circular_loading.dart';
import 'package:ecommerce/view/widgets/build_custom_button.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_custom_text_field.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:ecommerce/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  String? name, email, phoneNumber, address;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: Get.find<AuthViewModel>(),
      builder: (controller) {
        nameController.text = controller.userDataModel!.name!;
        emailController.text = controller.userDataModel!.email!;
        phoneNumberController.text = controller.userDataModel!.phoneNumber!;
        addressController.text = controller.userDataModel!.address!;
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
                  text: 'EDIT',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
                buildCustomText(
                  text: ' PROFILE',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 76,
                        backgroundColor: green.withOpacity(0.2),
                        child: CircleAvatar(
                          radius: 72,
                          backgroundColor: white,
                          backgroundImage: controller.imageProfile == null
                              ? NetworkImage(controller.userDataModel!.image
                                  .toString()) as ImageProvider
                              : FileImage(controller.imageProfile as File),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6, bottom: 6),
                        child: CircleAvatar(
                          backgroundColor: btn.withOpacity(0.45),
                          child: IconButton(
                            onPressed: () => controller.getImageProfile(),
                            splashRadius: 20,
                            icon: buildIcon(
                              icon: Icons.camera_alt_rounded,
                              color: black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  buildCustomTextField(
                    labelText: 'User Name',
                    controller: nameController,
                    type: TextInputType.name,
                    onChanged: (value) {
                      name = value!;
                    },
                    onSaved: (value) {
                      name = value!;
                    },
                  ),
                  const SizedBox(height: 10),
                  buildCustomTextField(
                    labelText: 'E-mail',
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value!;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                  ),
                  const SizedBox(height: 10),
                  buildCustomTextField(
                    labelText: 'Phone Number',
                    controller: phoneNumberController,
                    type: TextInputType.phone,
                    onChanged: (value) {
                      phoneNumber = value!;
                    },
                    onSaved: (value) {
                      phoneNumber = value!;
                    },
                  ),
                  const SizedBox(height: 10),
                  buildCustomTextField(
                    labelText: 'Address',
                    controller: addressController,
                    type: TextInputType.text,
                    onChanged: (value) {
                      address = value!;
                    },
                    onSaved: (value) {
                      address = value!;
                    },
                  ),
                  const SizedBox(height: 30),
                  controller.isLoading.value
                      ? buildCircularLoading()
                      : buildCustomButton(
                          text: 'update',
                          width: MediaQuery.of(context).size.width,
                          onPressed: () => controller.updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneNumberController.text,
                            address: addressController.text,
                          ),
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
