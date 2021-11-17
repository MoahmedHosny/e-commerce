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
      init: CheckOutViewModel(),
      builder: (controller) => Form(
        key: controller.formKey,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Image.asset('assets/images/check.png', scale: 2.2),
                      const SizedBox(width: 20),
                      Expanded(
                        child: buildCustomText(
                          text:
                              'Billing address is the same as delivery address',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  buildTextField(
                    labelText: 'Street 1',
                    controller: controller.street1Controller,
                  ),
                  const SizedBox(height: 15),
                  buildTextField(
                    labelText: 'Street 2',
                    controller: controller.street2Controller,
                  ),
                  const SizedBox(height: 15),
                  buildTextField(
                    labelText: 'City',
                    controller: controller.cityController,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextField(
                          labelText: 'State',
                          controller: controller.stateController,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: buildTextField(
                          labelText: 'Country',
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

  Widget buildTextField({
    String? labelText,
    TextEditingController? controller,
  }) {
    return buildCustomTextField(
      labelText: labelText,
      controller: controller,
      type: TextInputType.text,
      color: grey,
      validator: (val) {
        if (val.isEmpty) {
          return 'This field can\'t be empty';
        }
      },
    );
  }
}
