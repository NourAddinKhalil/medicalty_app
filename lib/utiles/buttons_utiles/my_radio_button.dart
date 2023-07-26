import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/themes/colors_constant.dart';
import '../../controllers/setting_controllers/units_of_measure_controller.dart';
import '../my_text.dart';

class MyRadioButton extends StatelessWidget {
  final String value;
  final String title;
  const MyRadioButton({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UnitsOfMeasureController>(
        init: UnitsOfMeasureController(),
        builder: (unitsOfMeasureController) {
          return InkWell(
            onTap: () {
              unitsOfMeasureController.selectButton(value);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  MyText(
                      text: title,
                      color: ColorsConstant.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                  const Spacer(),
                  Radio(
                    value: value,
                    groupValue: unitsOfMeasureController.selected,
                    onChanged: (String? value) {},
                    activeColor: ColorsConstant.green3,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
