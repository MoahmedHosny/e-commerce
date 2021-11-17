import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_snack_bar.dart';
import 'package:ecommerce/view_model/cart_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutViewModel extends GetxController {
  int index = 0;
  Pages pages = Pages.DeliveryTime;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController street1Controller = TextEditingController();
  TextEditingController street2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  CartViewModel cartViewModel = Get.find<CartViewModel>();

  Color getColor(int i) {
    if (i == index) {
      return black;
    } else if (i < index) {
      return green;
    } else {
      return const Color(0xffd1d2d7);
    }
  }

  void changeIndex(int i) {
    if (i == 0 || i < 0) {
      pages = Pages.DeliveryTime;
      index = i;
    } else if (i == 1) {
      pages = Pages.AddAddress;
      index = i;
    } else if (i == 2) {
      if (!formKey.currentState!.validate()) {
      } else {
        (formKey.currentState!.save());
        String id = FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Orders')
            .doc()
            .id;
        OrderModel orderModel = OrderModel(
          street1: street1Controller.text,
          street2: street2Controller.text,
          city: cityController.text,
          country: countryController.text,
          state: stateController.text,
          orderId: id,
          isTotalPrice: cartViewModel.isTotalPrice,
          products: cartViewModel.cartsList,
          time: DateTime.now().toString(),
        );
        FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Orders')
            .doc(id)
            .set(orderModel.toMap());
        cartViewModel.cartsList = [];
        buildSnackBar(
            title: 'Item Added', msg: 'The order has been successfully added');
        pages = Pages.Summary;
        index = i;
      }
    } else if (i == 3) {
      Get.offNamedUntil(HomeLayout, (route) => false);
      pages = Pages.DeliveryTime;
      index = 0;
    }
    update();
  }

  String? value;
  void changeRadio(val) {
    value = val;
    //  print(value);
    update();
  }

  List<String>? processes = [
    'Delivery',
    'Address',
    'Summer',
  ];
}
