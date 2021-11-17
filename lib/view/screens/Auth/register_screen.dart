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

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String? name, email, password, phoneNumber, address;
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
                      controller: nameController,
                      type: TextInputType.name,
                      onChanged: (value) {
                        name = value!;
                      },
                      onSaved: (value) {
                        name = value!;
                      },
                      validator: (value) {
                        if (value == null || value == '' || value.isEmpty) {
                          return 'Please enter your name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    buildCustomTextField(
                      hintText: 'E-mail',
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value!;
                      },
                      onSaved: (value) {
                        email = value!;
                      },
                      validator: (value) {
                        if (value == null || value == '' || value.isEmpty) {
                          return 'Please enter your e-mail';
                        } else if (!value.contains('@')) {
                          return 'Do use the @ char.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    buildCustomTextField(
                      hintText: 'Password',
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                      onChanged: (value) {
                        password = value!;
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                      validator: (value) {
                        if (value == null || value == '' || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 8) {
                          return 'Please enter a password 8+ char.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    buildCustomTextField(
                      hintText: 'Phone',
                      controller: phoneController,
                      type: TextInputType.number,
                      onChanged: (value) {
                        phoneNumber = value!;
                      },
                      onSaved: (value) {
                        phoneNumber = value!;
                      },
                      validator: (value) {
                        if (value == null || value == '' || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 11) {
                          return 'Please enter a password 11+ char.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    buildCustomTextField(
                      hintText: 'Address',
                      controller: addressController,
                      type: TextInputType.text,
                      onChanged: (value) {
                        address = value!;
                      },
                      onSaved: (value) {
                        address = value!;
                      },
                      validator: (value) {
                        if (value == null || value == '' || value.isEmpty) {
                          return 'Please enter your address';
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
                          controller.createUserWithEmailAndPassword(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phoneNumber: phoneController.text,
                            address: addressController.text,
                          );
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
