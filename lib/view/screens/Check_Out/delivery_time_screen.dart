import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view_model/check_out_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryTimeScreen extends StatelessWidget {
  const DeliveryTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Expanded(
        child: Column(
          children: [
            const SizedBox(height: 40),
            RadioListTile(
              value: (radios[0].title.toString()),
              groupValue: controller.value,
              onChanged: (val) {
                controller.changeRadio(val);
              },
              activeColor: green,
              title: buildCustomText(
                text: radios[0].title.toString(),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              subtitle: buildCustomText(text: radios[0].subtitle.toString()),
            ),
            const SizedBox(height: 30),
            RadioListTile(
              value: (radios[1].title.toString()),
              groupValue: controller.value,
              onChanged: (val) {
                controller.changeRadio(val);
              },
              activeColor: green,
              title: buildCustomText(
                text: radios[1].title.toString(),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              subtitle: buildCustomText(text: radios[1].subtitle.toString()),
            ),
            const SizedBox(height: 30),
            RadioListTile(
              value: (radios[2].title.toString()),
              groupValue: controller.value,
              onChanged: (val) {
                controller.changeRadio(val);
              },
              activeColor: green,
              title: buildCustomText(
                text: radios[2].title.toString(),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              subtitle: buildCustomText(text: radios[2].subtitle.toString()),
            ),
          ],
        ),
      ),
    );
  }
}

class Radio {
  String? title, subtitle;
  Radio({required this.title, required this.subtitle});
}

List<Radio> radios = [
  Radio(
    title: 'Standard Delivery',
    subtitle: 'Order will be delivered between 3 - 5\nbusiness days',
  ),
  Radio(
    title: 'Next Day Delivery',
    subtitle:
        'Place your order before 6pm and your items\nwill be delivered the next day',
  ),
  Radio(
    title: 'Nominated Delivery',
    subtitle:
        'Pick a particular date from the calendar and\norder will be delivered on selected date',
  ),
];
