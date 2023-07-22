import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/employee_screen_controller.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/show_date_time_picker.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/select_item_button.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_suggestion_helpers.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_field.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';

class NewEmployeeScreen extends GetView<EmployeeScreenController> {
  const NewEmployeeScreen({super.key});

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
            title: 'New Employee',
          ),
          body: SafeArea(
            child: GetBuilder<EmployeeScreenController>(
                init: EmployeeScreenController(),
                builder: (controller) {
                  return CustomForm(
                    saveButtonText: 'Create Employee',
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
                        '#ID Employee',
                        textAlign: TextAlign.center,
                        style: FontSizes.h7?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorsConstant.primaryColor,
                        ),
                      ),
                      const VerticalSizedBox(35),
                      CustomTextFormField(
                        label: 'Employee Name',
                        horizantalPadding: 20,
                        controller: controller.nameTxtField,
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
                        label: 'Username',
                        horizantalPadding: 20,
                        controller: controller.usernameTxtField,
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
                        label: 'Hourly Salary',
                        horizantalPadding: 20,
                        controller: controller.hourlySalaryTxtField,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateMoneyField,
                        icon: Icons.attach_money,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Total Salary',
                        horizantalPadding: 20,
                        controller: controller.totalSalaryTxtField,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateMoneyField,
                        icon: Icons.attach_money,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Date of Birth',
                        controller: controller.birthDateTxtField,
                        horizantalPadding: 20,
                        readOnly: true,
                        textInputType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateDateFormat,
                        icon: Icons.calendar_month_outlined,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                        onTap: () async {
                          controller.birthDateTxtField.text =
                              await ShowDateTimePickers.showCustomDatePicker(
                                  controller.birthDateTxtField.text);
                        },
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(15),
                      CustomTextField(
                        title: 'Belongs to',
                        hintText: 'Belongs to',
                        horizantalPadding: 20,
                        showHint: true,
                        showlable: false,
                        controller: controller.belongsToTxtField,
                        suggestionCallback: (val) {
                          return [];
                        },
                        fieldList: const [],
                        onSuggestionSelected: (selected) {},
                        itemBuilder: (context, suggestion) {
                          return CustomSuggestionHelpers
                              .itemPrimativTypesBuilder(
                            context,
                            suggestion,
                            controller.belongsToTxtField.text,
                          );
                        },
                      ),
                      const VerticalSizedBox(15),
                      SelectItemButton(
                        title: 'Multiple Working',
                        iconOnEnd: true,
                        iconColor: ColorsConstant.green1,
                        onTab: () {
                          // Get.to(() => const MessageScreen());
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextField(
                        title: 'Working Time',
                        hintText: 'Working Time',
                        horizantalPadding: 20,
                        showHint: true,
                        showlable: false,
                        controller: controller.workingTimeTxtField,
                        suggestionCallback: (val) {
                          return [];
                        },
                        fieldList: const [],
                        onSuggestionSelected: (selected) {},
                        itemBuilder: (context, suggestion) {
                          return CustomSuggestionHelpers
                              .itemPrimativTypesBuilder(
                            context,
                            suggestion,
                            controller.workingTimeTxtField.text,
                          );
                        },
                      ),
                      const VerticalSizedBox(30),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
