import 'package:ecommerce/helpers/database_helper.dart';
import 'package:ecommerce/model/favorite_model.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteViewModel extends GetxController {
  FavoriteViewModel() {
    getAllFav();
  }

  List<FavoriteModel>? favList = [];
  Future<List<FavoriteModel>?> getAllFav() async {
    await DbHelper.db.getAllFav().then((data) {
      favList = data;
      print(favList!.length);
    }).catchError((error) {
      print('The Error in Fav ' + error.toString());
    });
    update();
  }

  Future<void> addProductToFav(FavoriteModel favoriteModel) async {
    for (int i = 0; i < favList!.length; i++) {
      if (favList![i].productId == favoriteModel.productId) {
        return buildSnackBar(
          title: 'Check Your Favorite',
          msg: '${favoriteModel.title} is already added in favorite',
        );
      }
    }
    await DbHelper.db.insertFavDb(favoriteModel).then((value) {
      buildSnackBar(
        title: 'Item Added',
        msg: '${favoriteModel.title} was added to your favorite',
      );
    }).catchError((error) {
      buildSnackBar(title: 'Error', msg: error.toString());
    });
    update();
  }

  Future<void> removeProductFromFav(
      {required int id, required int index}) async {
    DbHelper.db.deleteFavDb(id);
    DbHelper.db.updateFavDb(favList![index]);
    buildSnackBar(
      title: 'Item Removed',
      msg: '${favList![index].title} was removed to your favorite',
    );
    favList!.removeAt(index);
    update();
  }
}
