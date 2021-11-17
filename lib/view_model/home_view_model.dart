import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  HomeViewModel() {
    getCategories();
    getProducts();
    getMenProducts();
    getWomenProducts();
    getGadgetsProducts();
    getDevicesProducts();
    getGamingProducts();
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
      for (var item in data.docs) {
        category.add(CategoryModel.fromJson(item.data()));
      }
      // for (int i = 0; i < data.docs.length; i++) {
      //   category.add(CategoryModel.fromJson(data.docs[i].data()));
      // }
      isLoading.value = false;
      update();
    }).catchError((error) {
      print('The Error' + error.toString());
    });
  }

  /// Method Get Products From FireStore
  List<ProductModel> products = [];
  List<ProductModel> men = [];
  List<ProductModel> women = [];
  List<ProductModel> gadgets = [];
  List<ProductModel> devices = [];
  List<ProductModel> gaming = [];
  Future<void> getProducts() async {
    isLoading.value = true;
    await FirebaseFirestore.instance.collection('Products').get().then((data) {
      for (var item in data.docs) {
        products.add(ProductModel.fromJson(item.data()));
      }
      // for (int i = 0; i < data.docs.length; i++) {
      //   products.add(ProductModel.fromJson(data.docs[i].data()));
      // }
      isLoading.value = false;
      update();
    }).catchError((error) {
      print('The Error ' + error.toString());
    });
  }

  Future<void> getMenProducts() async {
    await FirebaseFirestore.instance
        .collection('Products')
        .where("categoryName", isEqualTo: "Men")
        .get()
        .then((data) {
      for (var item in data.docs) {
        men.add(ProductModel.fromJson(item.data()));
      }
    }).catchError((error) {
      print('The Error ' + error.toString());
    });
  }
  Future<void> getWomenProducts() async {
    await FirebaseFirestore.instance
        .collection('Products')
        .where("categoryName", isEqualTo: "Women")
        .get()
        .then((data) {
      for (var item in data.docs) {
        women.add(ProductModel.fromJson(item.data()));
      }
    }).catchError((error) {
      print('The Error ' + error.toString());
    });
  }
  Future<void> getGadgetsProducts() async {
    await FirebaseFirestore.instance
        .collection('Products')
        .where("categoryName", isEqualTo: "Gadgets")
        .get()
        .then((data) {
      for (var item in data.docs) {
        gadgets.add(ProductModel.fromJson(item.data()));
      }
    }).catchError((error) {
      print('The Error ' + error.toString());
    });
  }
  Future<void> getDevicesProducts() async {
    await FirebaseFirestore.instance
        .collection('Products')
        .where("categoryName", isEqualTo: "Devices")
        .get()
        .then((data) {
      for (var item in data.docs) {
        devices.add(ProductModel.fromJson(item.data()));
      }
    }).catchError((error) {
      print('The Error ' + error.toString());
    });
  }
  Future<void> getGamingProducts() async {
    await FirebaseFirestore.instance
        .collection('Products')
        .where("categoryName", isEqualTo: "Gaming")
        .get()
        .then((data) {
      for (var item in data.docs) {
        gaming.add(ProductModel.fromJson(item.data()));
      }
    }).catchError((error) {
      print('The Error ' + error.toString());
    });
  }
}
