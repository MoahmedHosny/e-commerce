class CartModel {
  int? id;
  String? productId;
  String? image;
  late int quantity;
  String? title;
  String? price;

  CartModel({
    this.id,
    this.productId,
    this.image,
    required this.quantity,
    this.title,
    this.price,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    image = json['image'];
    quantity = json['quantity'];
    title = json['title'];
    price = json['price'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'image': image,
      'quantity': quantity,
      'title': title,
      'price': price,
    };
  }
}
