import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  HomeViewModel() {
    getCategories();
    getProducts();
  }
  // ValueNotifier<bool> get isLoading => _isLoading;
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  /// Method Get Categories From FireStore
  List<CategoryModel> category = [];
  Future<void> getCategories() async {
    isLoading.value = true;
    await FirebaseFirestore.instance
        .collection('Categories')
        .get()
        .then((data) {
      for (int i = 0; i < data.docs.length; i++) {
        category.add(CategoryModel.formJson(data.docs[i].data()));
      }
      isLoading.value = false;
      update();
    }).catchError((error) {
      print('The Error' + error.toString());
    });
  }

  /// Method Get Products From FireStore
  List<ProductModel> products = [];
  Future<void> getProducts() async {
    isLoading.value = true;
    await FirebaseFirestore.instance.collection('Products').get().then((data) {
      for (int i = 0; i < data.docs.length; i++) {
        products.add(ProductModel.formJson(data.docs[i].data()));
      }
      isLoading.value = false;
      update();
    }).catchError((error) {
      print('The Error ' + error.toString());
    });
  }
}
