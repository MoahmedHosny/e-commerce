import 'package:ecommerce/helpers/extension_hex.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? productId;
  String? image;
  String? title;
  String? price;
  Color? color;
  String? description;
  List<dynamic>? sizes;

  ProductModel({
    this.productId,
    this.image,
    this.title,
    this.price,
    this.color,
    this.description,
    this.sizes,
  });
  ProductModel.formJson(Map<String, dynamic> json) {
    productId = json['productId'];
    image = json['image'];
    title = json['title'];
    price = json['price'];
    color = HexColor.fromHex(json['color']);
    description = json['description'];
    sizes = json['sizes'];
  }
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'image': image,
      'title': title,
      'price': price,
      'color': color,
      'description': description,
      'sizes': sizes,
    };
  }
}
