import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/screen_controllers/pay_type_controller.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';

class DepoTextField extends StatelessWidget {
  const DepoTextField({
    super.key,
    required this.textController,
    required this.textTitle,
    required this.onSaved,
  });

  final TextEditingController textController;
  final String textTitle;
  final Function(String? value) onSaved;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PayTypeController>(
      id: 'payment_type',
      builder: (payController) {
        return CustomTextFormField(
          label: textTitle,
          controller: textController,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.number,
          validator: (value) {
            return Validators.validateMoneyField(value, false);
          },
          fillColor: null,
          showUnderlinedStyle: true,
          icon: payController.isMoney
              ? Icons.attach_money_outlined
              : Icons.percent_outlined,
          maxLength: payController.isRatio ? 3 : null,
          onSaved: onSaved,
        );
      },
    );
  }
}
