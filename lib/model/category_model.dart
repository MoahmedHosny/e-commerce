class CategoryModel {
  String? image;
  String? name;
  int? id;
  CategoryModel({this.image, this.name, this.id});
  CategoryModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    id = json['id'];
  }
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'id': id,
    };
  }
}
