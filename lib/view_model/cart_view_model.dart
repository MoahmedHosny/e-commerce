import 'package:ecommerce/helpers/database_helper.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/view/widgets/build_snack_bar.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  CartViewModel() {
    getAllCarts();
  }

  /// GET All Products In Carts
  List<CartModel>? cartsList = [];
  Future<List<CartModel>?> getAllCarts() async {
    await DbHelper.db.getAllCarts().then((data) {
      cartsList = data;
      //  print(cartsList!.length);
      getTotalPrice();
      return cartsList;
    }).catchError((error) {
      print('The Error ---> ' + error.toString());
    });
    update();
  }

  /// Add Products To Carts
  Future<void> addProductToCart(CartModel cartModel) async {
    for (int i = 0; i < cartsList!.length; i++) {
      if (cartsList![i].productId == cartModel.productId) {
        return buildSnackBar(
          title: 'Check Your Cart',
          msg: '${cartModel.title} is already added in cart',
        );
      }
    }
    await DbHelper.db.insertCartDb(cartModel).then((data) {
      buildSnackBar(
        title: 'Item Added',
        msg: '${cartModel.title} was added to your cart',
      );
    }).catchError((error) {
      buildSnackBar(title: 'Error', msg: error.toString());
    });
    update();
  }

  /// GET Total Price
  double isTotalPrice = 0.0;
  Future<void> getTotalPrice() async {
    for (int i = 0; i < cartsList!.length; i++) {
      isTotalPrice +=
          (double.parse(cartsList![i].price!) * cartsList![i].quantity);
    }
    //  print(isTotalPrice);
    update();
  }

  /// Increment Quantity
  Future<void> incrementQuantity(int index) async {
    cartsList![index].quantity++;
    isTotalPrice += (double.parse(cartsList![index].price!));
    DbHelper.db.updateCartDb(cartsList![index]);
    update();
  }

  /// Decrement Quantity
  Future<void> decrementQuantity(int index) async {
    cartsList![index].quantity--;
    isTotalPrice -= (double.parse(cartsList![index].price!));
    DbHelper.db.updateCartDb(cartsList![index]);
    update();
  }

  /// Remove Products From Cart
  Future<void> removeProductFromCart(
      {required int id, required int index}) async {
    DbHelper.db.deleteCartDb(id);
    decrementQuantity(index);
    buildSnackBar(
      title: 'Item Removed',
      msg: '${cartsList![index].title} was removed to your cart',
    );
    cartsList!.removeAt(index);
    update();
  }
}
