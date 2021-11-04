class FavoriteModel {
  int? id;
  String? productId;
  String? title;
  String? image;
  String? price;
  FavoriteModel({
    this.id,
    this.productId,
    this.image,
    this.title,
    this.price,
  });

  FavoriteModel.formJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    image = json['image'];
    title = json['title'];
    price = json['price'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'image': image,
      'title': title,
      'price': price,
    };
  }
}
