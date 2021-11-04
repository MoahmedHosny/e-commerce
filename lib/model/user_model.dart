class UserDataModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? image;
  String? uid;

  UserDataModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.image,
    this.uid,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    image = json['image'];
    uid = json['uid'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'image': image,
      'uid': uid,
    };
  }
}
