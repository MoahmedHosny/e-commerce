import 'package:ecommerce/helpers/binding.dart';
import 'package:ecommerce/helpers/cache_helper.dart';
import 'package:ecommerce/layout/home_layout_screen.dart';
import 'package:ecommerce/view/screens/Account/edit_profile_screen.dart';
import 'package:ecommerce/view/screens/Auth/login_screen.dart';
import 'package:ecommerce/view/screens/Auth/register_screen.dart';
import 'package:ecommerce/view/screens/Check_Out/check_out_screen.dart';
import 'package:ecommerce/view/screens/Home/all_products_screen.dart';
import 'package:ecommerce/view/widgets/build_theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'constants/constants.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Cache Helper
  await CacheHelper.init();
  final Widget startWidget;
  String uid = await CacheHelper.getData(key: 'uid') ?? '';
  if (uid.isEmpty) {
    startWidget = LoginScreen();
  } else {
    startWidget = const HomeLayoutScreen();
  }
  runApp(MyApp(startWidget: startWidget));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({Key? key, this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      theme: buildThemeData(),
      home: startWidget,
      getPages: [
        GetPage(name: Login, page: () => LoginScreen()),
        GetPage(name: Register, page: () => RegisterScreen()),
        // GetPage(name: Controller, page: () => const ControllerScreen()),

        GetPage(name: HomeLayout, page: () => const HomeLayoutScreen()),
        GetPage(name: EditProfile, page: () => EditProfileScreen()),

        GetPage(name: HomeLayout, page: () => const HomeLayoutScreen()),
        GetPage(name: EditProfile, page: () => EditProfileScreen()),
        GetPage(name: AllProducts, page: () => const AllProductsScreen()),
        GetPage(name: CheckOut, page: () => const CheckOutScreen()),

      ],
    );
  }
}
