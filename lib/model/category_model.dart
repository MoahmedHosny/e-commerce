class CategoryModel {
  dynamic image;
  String? name;
  CategoryModel({this.image, this.name});
  CategoryModel.formJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
  }
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
    };
  }
}
