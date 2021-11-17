import 'package:ecommerce/styles/colors/colors.dart';
import 'package:ecommerce/view/widgets/build_custom_text.dart';
import 'package:ecommerce/view/widgets/build_custom_text_field.dart';
import 'package:ecommerce/view_model/check_out_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find<CheckOutViewModel>(),
      builder: (controller) => Form(
        key: controller.formKey,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  buildItem(
                    text: 'Street 1',
                    controller: controller.street1Controller,
                  ),
                  const SizedBox(height: 15),
                  buildItem(
                    text: 'Street 2',
                    controller: controller.street2Controller,
                  ),
                  const SizedBox(height: 15),
                  buildItem(
                    text: 'City',
                    controller: controller.cityController,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: buildItem(
                          text: 'State',
                          controller: controller.stateController,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: buildItem(
                          text: 'Country',
                          controller: controller.countryController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem({
    String? text,
    String? initialValue,
    TextEditingController? controller,
  }) {
    return Column(
      children: [
        buildCustomText(text: text!, fontSize: 16, color: grey),
        buildCustomTextField(
          controller: controller,
          type: TextInputType.text,
          validator: (val) {
            if (val.isEmpty) {
              return 'This field can\'t be empty';
            }
          },
        ),
      ],
    );
  }
}
