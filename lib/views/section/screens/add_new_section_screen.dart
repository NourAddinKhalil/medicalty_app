import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/department_screen_controller.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/image_string_helpers.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';

class AddNewSectionScreen extends GetView<DepartmentScreenController> {
  const AddNewSectionScreen({super.key});
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
            title: 'Create a new section',
          ),
          body: SafeArea(
            child: GetBuilder<DepartmentScreenController>(
              init: DepartmentScreenController(),
              builder: (controller) {
                return CustomForm(
                  paddingHorizantal: 20,
                  saveButtonText: 'Create Section',
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
                        allowedExtensions: ImageStringHelpers.imagesExtensions,
                        showChooseDocument: false,
                        showChooseVideo: false,
                        image: controller.image,
                        onImageChoosen: controller.onImageChoosen,
                      ),
                    ),
                    const VerticalSizedBox(15),
                    Text(
                      '#Id Section',
                      textAlign: TextAlign.center,
                      style: FontSizes.h7?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorsConstant.primaryColor,
                      ),
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Department Name',
                      controller: controller.departmentNameTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: Validators.checkIfNotEmpty,
                      icon: Icons.business_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          name: value,
                        );
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Description',
                      controller: controller.descriptionTxtField,
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 5,
                      validator: Validators.checkIfNotEmpty,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          description: value,
                        );
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(40),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
