import 'package:ecommerce/view/widgets/build_custom_button.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_custom_text_field.dart';
import 'package:ecommerce/view_model/auth_view_model.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          splashRadius: 25,
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GetBuilder<AuthViewModel>(
          init: AuthViewModel(),
          builder: (controller) => Card(
            elevation: 5,
            margin:
                const EdgeInsetsDirectional.only(top: 40, start: 10, end: 10),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 15, left: 20, right: 20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildCustomText(
                      text: 'Sign Up',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 30),
                    buildCustomTextField(
                      hintText: 'Name',
                      controller: controller.nameController,
                      type: TextInputType.name,
                      onChanged: (value) {
                        controller.name = value!;
                      },
                      onSaved: (value) {
                        controller.name = value!;
                      },
                      validator: (value) {
                        if (value == null || value == '' || value.isEmpty) {
                          return 'Please Enter Your Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    buildCustomTextField(
                      hintText: 'E-mail',
                      controller: controller.emailController,
                      type: TextInputType.emailAddress,
                      onChanged: (value) {
                        controller.email = value!;
                      },
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (value) {
                        if (value == null || value == '' || value.isEmpty) {
                          return 'Please Enter Your E-mail';
                        } else if (!value.contains('@')) {
                          return 'Do Use The @ Char.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    buildCustomTextField(
                      hintText: 'Password',
                      controller: controller.passwordController,
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                      onChanged: (value) {
                        controller.password = value!;
                      },
                      onSaved: (value) {
                        controller.password = value!;
                      },
                      validator: (value) {
                        if (value == null || value == '' || value.isEmpty) {
                          return 'Please Enter Your Password';
                        } else if (value.length < 8) {
                          return 'Please Enter a Password 8+ Char.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    buildCustomTextField(
                      hintText: 'Phone',
                      controller: controller.phoneController,
                      type: TextInputType.number,
                      onChanged: (value) {
                        controller.phoneNumber = value!;
                      },
                      onSaved: (value) {
                        controller.phoneNumber = value!;
                      },
                      validator: (value) {
                        if (value == null || value == '' || value.isEmpty) {
                          return 'Please Enter Your Password';
                        } else if (value.length < 11) {
                          return 'Please Enter a Password 11+ Char.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    buildCustomTextField(
                      hintText: 'Address',
                      controller: controller.addressController,
                      type: TextInputType.text,
                      onChanged: (value) {
                        controller.address = value!;
                      },
                      onSaved: (value) {
                        controller.address = value!;
                      },
                      validator: (value) {
                        if (value == null || value == '' || value.isEmpty) {
                          return 'Please Enter Your Address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    buildCustomButton(
                      text: 'sign up',
                      width: MediaQuery.of(context).size.width,
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                        } else {
                          (formKey.currentState!.save());
                          controller.createUserWithEmailAndPassword();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
