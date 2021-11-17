import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_button.dart';
import 'package:ecommerce/view/widgets/build_custom_button_social.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_custom_text_field.dart';
import 'package:ecommerce/view_model/auth_view_model.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GetBuilder<AuthViewModel>(
          init: AuthViewModel(),
          builder: (controller) => Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 40, start: 10, end: 10),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 10, bottom: 15, start: 20, end: 20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              buildCustomText(
                                text: 'Welcome,',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              const Spacer(),
                              GestureDetector(
                                child: buildCustomText(
                                  text: 'Sign Up',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: green,
                                ),
                                onTap: () => Get.toNamed(Register),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          buildCustomText(
                            text: 'Sign in to Continue',
                            fontSize: 14,
                            color: grey,
                          ),
                          const SizedBox(height: 30),
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
                              if (value == null ||
                                  value == '' ||
                                  value.isEmpty) {
                                return 'Please enter your e-mail';
                              } else if (!value.contains('@')) {
                                return 'Do use the @ char.';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 15),
                          buildCustomTextField(
                            hintText: 'Password',
                            isPassword: true,
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            onChanged: (value) {
                              password = value!;
                            },
                            onSaved: (value) {
                              password = value!;
                            },
                            validator: (value) {
                              if (value == null ||
                                  value == '' ||
                                  value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 8) {
                                return 'Enter a password 8+ char.';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 15),
                          buildCustomText(
                            text: 'Forgot Password ?',
                            alignment: Alignment.centerRight,
                            fontSize: 16,
                            color: grey,
                          ),
                          const SizedBox(height: 30),
                          buildCustomButton(
                            text: 'sign in',
                            width: MediaQuery.of(context).size.width,
                            onPressed: () {
                              if (!formKey.currentState!.validate()) {
                              } else {
                                (formKey.currentState!.save());
                                controller.userLoginWithEmail(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                buildCustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                  fontSize: 20,
                ),
                const SizedBox(height: 15),
                buildCustomButtonSocial(
                  image: 'assets/images/facebook.png',
                  text: 'Sign In with Facebook',
                  onPressed: () {
                    controller.userLoginWithFacebook();
                  },
                ),
                const SizedBox(height: 15),
                buildCustomButtonSocial(
                  image: 'assets/images/google.png',
                  text: 'Sign In with Google',
                  onPressed: () {
                    controller.userLoginWithGoogle();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
