import 'package:ecommerce/model/cart_model.dart';

class OrderModel {
  String? street1;
  String? street2;
  String? city;
  String? state;
  String? country;
  String? orderId;
  String? time;
  String? deliveryTime;
  String? deliveryType;
  double? isTotalPrice;
  List<CartModel>? products = [];

  OrderModel({
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
    this.time,
    this.deliveryTime,
    this.deliveryType,
    this.orderId,
    this.isTotalPrice,
    this.products,
  });
  OrderModel.fromJson(Map<String, dynamic> json) {
    street1 = json['street1'];
    street2 = json['street2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    time = json['time'];
    deliveryTime = json['deliveryTime'];
    deliveryType = json['deliveryType'];
    orderId = json['orderId'];
    isTotalPrice = json['isTotalPrice'];
    for (var item in products!) {
      json['products'].add(item.title);
    }
  }
  Map<String, dynamic> toMap() {
    return {
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'country': country,
      'time': time,
      'deliveryTime': deliveryTime,
      'deliveryType': deliveryType,
      'orderId': orderId,
      'isTotalPrice': isTotalPrice,
      'products': products!.map((item) => item.toMap()).toList(),
    };
  }
}
