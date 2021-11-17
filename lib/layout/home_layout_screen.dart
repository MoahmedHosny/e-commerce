import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view_model/controller_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerViewModel>(
      init: ControllerViewModel(),
      builder: (controllerHomeLayout) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          titleSpacing: 10,
          title: Row(
            children: [
              buildCustomText(
                text: 'SHOP',
                fontWeight: FontWeight.bold,
                color: black,
                letterSpacing: 0.4,
              ),
              buildCustomText(
                text: 'PING',
                fontWeight: FontWeight.bold,
                color: green,
                letterSpacing: 0.4,
              ),
            ],
          ),
        ),
        body: controllerHomeLayout.screens[controllerHomeLayout.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: controllerHomeLayout.bottomItems,
          currentIndex: controllerHomeLayout.currentIndex,
          onTap: (index) {
            controllerHomeLayout.changeBottomNav(index);
          },
        ),
      ),
    );
  }
}
