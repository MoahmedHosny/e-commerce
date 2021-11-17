import 'package:ecommerce/view_model/auth_view_model.dart';
import 'package:ecommerce/view_model/cart_view_model.dart';
import 'package:ecommerce/view_model/check_out_view_model.dart';
import 'package:ecommerce/view_model/controller_view_model.dart';
import 'package:ecommerce/view_model/favorite_view_model.dart';
import 'package:ecommerce/view_model/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControllerViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => FavoriteViewModel());
    Get.lazyPut(() => CheckOutViewModel());
  }
}
