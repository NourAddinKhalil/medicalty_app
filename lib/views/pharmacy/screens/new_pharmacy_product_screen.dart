import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/pharmacy_product_screen_controller.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/select_item_button.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';

class NewPharmacyProductScreen
    extends GetView<PharmacyProductScreenController> {
  const NewPharmacyProductScreen({super.key});
  Future<void> save() async {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: AppBackground(
        child: Scaffold(
          appBar: const CustomAppbar(
            title: 'Adding product pharmacy',
          ),
          body: SafeArea(
            child: GetBuilder<PharmacyProductScreenController>(
                init: PharmacyProductScreenController(),
                builder: (controller) {
                  return CustomForm(
                    saveButtonText: 'Create Product',
                    paddingHorizantal: 0,
                    childrenAfterSaveButton: const [
                      VerticalSizedBox(15),
                    ],
                    save: save,
                    children: [
                      const VerticalSizedBox(15),
                      Center(
                        child: CustomImageViewer(
                          enableRadius: true,
                          enableTabToChoose: true,
                          height: 120,
                          width: 120,
                          index: 0,
                          imageHandeler: (index, image) {
                            //
                          },
                        ),
                      ),
                      const VerticalSizedBox(15),
                      Text(
                        '#ID Product',
                        textAlign: TextAlign.center,
                        style: FontSizes.h7?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorsConstant.primaryColor,
                        ),
                      ),
                      const VerticalSizedBox(35),
                      CustomTextFormField(
                        label: 'product name',
                        horizantalPadding: 20,
                        controller: controller.productNameTxtField,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: Validators.checkIfNotEmpty,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Product Description',
                        horizantalPadding: 20,
                        controller: controller.productDescriptionTxtField,
                        textInputType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        minLines: 5,
                        validator: Validators.checkIfNotEmpty,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Product information',
                        controller: controller.productInformationTxtField,
                        textInputType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        horizantalPadding: 20,
                        minLines: 5,
                        validator: Validators.checkIfNotEmpty,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(15),
                      SelectItemButton(
                        title: 'Pictures of the product',
                        onTab: () {},
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Price \$',
                        controller: controller.priceTxtField,
                        horizantalPadding: 20,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateMoneyField,
                        showSuffix: false,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(60),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
