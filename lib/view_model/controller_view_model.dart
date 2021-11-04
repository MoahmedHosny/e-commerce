import 'package:ecommerce/view/screens/Account/account_screen.dart';
import 'package:ecommerce/view/screens/Cart/cart_screen.dart';
import 'package:ecommerce/view/screens/Favorite/favorite_screen.dart';
import 'package:ecommerce/view/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerViewModel extends GetxController {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    AccountScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/icons/explore.png', scale: 2.0),
      activeIcon: const Text('Explore'),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/icons/cart.png', scale: 2.0),
      activeIcon: const Text('Cart'),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/icons/wishlist.png', scale: 2.0),
      activeIcon: const Text('Favorite'),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/icons/user.png', scale: 2.0),
      activeIcon: const Text('Account'),
      label: '',
    ),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    update();
  }
}
