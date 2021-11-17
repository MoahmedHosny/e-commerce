import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/screens/Check_Out/add_address_screen.dart';
import 'package:ecommerce/view/screens/Check_Out/delivery_time_screen.dart';
import 'package:ecommerce/view/screens/Check_Out/summary_screen.dart';
import 'package:ecommerce/view/widgets/build_custom_button.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_icon.dart';
import 'package:ecommerce/view_model/check_out_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            splashRadius: 25,
            icon: buildIcon(
              icon: Icons.arrow_back_rounded,
              color: black,
              size: 22,
            ),
          ),
          title: buildCustomText(text: 'CheckOut', fontWeight: FontWeight.bold),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.085,
              child: StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.horizontal,
                  connectorTheme:
                      const ConnectorThemeData(space: 1, thickness: 1),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemWidth: (index) =>
                      MediaQuery.of(context).size.width /
                      controller.processes!.length,
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: buildCustomText(
                        text: controller.processes![index],
                        fontWeight: FontWeight.bold,
                        color: controller.getColor(index),
                        alignment: Alignment.center,
                      ),
                    );
                  },
                  indicatorWidgetBuilder: (context, index) {
                    if (index <= controller.index) {
                      return DotIndicator(
                        size: 25,
                        border: Border.all(color: green, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: green,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return OutlinedDotIndicator(
                        size: 25,
                        borderWidth: 1,
                        color: controller.getColor(index),
                      );
                    }
                  },
                  lineWidgetBuilder: (index) {
                    if (index > 0) {
                      if (index == controller.index) {
                        Color primColor = controller.getColor(index - 1);
                        Color color = controller.getColor(index);
                        List<Color> gradientColors;
                        gradientColors = [
                          primColor,
                          Color.lerp(primColor, color, 0)!
                        ];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: controller.getColor(index),
                        );
                      }
                    }
                  },
                  itemCount: controller.processes!.length,
                ),
              ),
            ),
            controller.pages == Pages.DeliveryTime
                ? const DeliveryTimeScreen()
                : controller.pages == Pages.AddAddress
                    ? const AddAddressScreen()
                    : const SummaryScreen(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                children: [
                  if (controller.index != 0)
                    buildCustomButton(
                      text: 'Back',
                      height: size.height * 0.048,
                      width: size.width * 0.45,
                      alignment: Alignment.bottomLeft,
                      backColor: white,
                      textColor: black,
                      borderColor: green.withOpacity(0.5),
                      onPressed: () =>
                          controller.changeIndex(controller.index - 1),
                    ),
                  const Spacer(),
                  buildCustomButton(
                    text: 'Next',
                    height: size.height * 0.05,
                    width: size.width * 0.45,
                    alignment: Alignment.bottomRight,
                    onPressed: () =>
                        controller.changeIndex(controller.index + 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
