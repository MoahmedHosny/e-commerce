import 'package:ecommerce/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData buildThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: white,
    fontFamily: 'Lato',
    appBarTheme: const AppBarTheme(
      backgroundColor: white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: transparent,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      elevation: 0,
      selectedItemColor: black,
    ),
  );
}
