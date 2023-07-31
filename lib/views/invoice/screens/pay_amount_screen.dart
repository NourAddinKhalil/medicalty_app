import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/screen_controllers/money_screen_controller.dart';
import 'package:medicalty/controllers/screen_controllers/pay_type_controller.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/views/invoice/widgets/depo_text_field.dart';
import 'package:medicalty/views/requests/widgets/arrival_time_widget.dart';

class PayAmountScreen extends GetView<MoneyScreenController> {
  const PayAmountScreen({
    super.key,
    required this.tagName,
  });
  final String tagName;
  @override
  String? get tag => tagName;

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'Add ${controller.title}',
          icon: Icons.clear_outlined,
          backOnRightSide: true,
          // iconColor: ColorsConstant.green1,
        ),
        body: CustomForm(
          paddingHorizantal: 20,
          saveButtonText: 'Save ${controller.title}',
          save: () async {
            controller.update();
            Get.back();
          },
          children: [
            const VerticalSizedBox(15),
            GetBuilder<PayTypeController>(
              init: PayTypeController(controller.moneyType),
              id: 'payment_type',
              builder: (payController) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ArrivalTimeWidget(
                        title: '\$',
                        selected: payController.isMoney,
                        onChange: (newVal) {
                          payController.isMoney = newVal;
                        },
                        activateOnTab: !controller.onlyOneType,
                      ),
                    ),
                    Expanded(
                      child: ArrivalTimeWidget(
                        title: '%',
                        selected: payController.isRatio,
                        onChange: (newVal) {
                          payController.isRatio = newVal;
                        },
                        activateOnTab: !controller.onlyOneType,
                      ),
                    ),
                  ],
                );
              },
            ),
            const VerticalSizedBox(15),
            // Discount
            DepoTextField(
              textController: controller.amountTxtController,
              textTitle: controller.title,
              onSaved: (value) {
                controller.moneyType = Get.find<PayTypeController>().type;
              },
            ),
            const VerticalSizedBox(100),
          ],
        ),
      ),
    );
  }
}
