import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/appointment_booking_screen_controller.dart';
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

class AppointmentBookingScreen
    extends GetView<AppointmentBookingScreenController> {
  const AppointmentBookingScreen({super.key});

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
            title: 'Appointment booking',
          ),
          body: SafeArea(
            child: GetBuilder<AppointmentBookingScreenController>(
              init: AppointmentBookingScreenController(),
              builder: (controller) {
                return CustomForm(
                  saveButtonText: 'Create Appointment',
                  paddingHorizantal: 0,
                  childrenAfterSaveButton: const [
                    VerticalSizedBox(15),
                  ],
                  save: save,
                  children: [
                    const VerticalSizedBox(15),
                    CustomTextField(
                      title: 'Selected a doctor',
                      hintText: 'Selected a doctor',
                      horizantalPadding: 20,
                      showHint: true,
                      showlable: false,
                      controller: controller.doctorTxtField,
                      suggestionCallback: (val) {
                        return [];
                      },
                      fieldList: const [],
                      onSuggestionSelected: (selected) {},
                      itemBuilder: (context, suggestion) {
                        return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                          context,
                          suggestion,
                          controller.doctorTxtField.text,
                        );
                      },
                    ),
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
                    const VerticalSizedBox(35),
                    CustomTextFormField(
                      label: 'Doctor\'s job number - Auto full',
                      horizantalPadding: 20,
                      controller: controller.doctorJobNumberTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      showClearIcon: false,
                      readOnly: true,
                      fillColor: const Color(0xFF5B5B5B).withOpacity(0.25),
                      innerTextStyle: FontSizes.h8?.copyWith(
                        color: Colors.white,
                      ),
                      validator: Validators.checkIfNotEmpty,
                      onSaved: (value) {
                        // _signupModel = _signupModel.copyWith(name: value);
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'doctor\'s name - Auto full',
                      horizantalPadding: 20,
                      controller: controller.doctorNameTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      showClearIcon: false,
                      readOnly: true,
                      fillColor: const Color(0xFF5B5B5B).withOpacity(0.25),
                      innerTextStyle: FontSizes.h8?.copyWith(
                        color: Colors.white,
                      ),
                      validator: Validators.checkIfNotEmpty,
                      onSaved: (value) {
                        // _signupModel = _signupModel.copyWith(name: value);
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(35),
                    CustomTextField(
                      title: 'assigned to the patient',
                      hintText: 'assigned to the patient',
                      horizantalPadding: 20,
                      showHint: true,
                      showlable: false,
                      controller: controller.patientTxtField,
                      suggestionCallback: (val) {
                        return [];
                      },
                      fieldList: const [],
                      onSuggestionSelected: (selected) {},
                      itemBuilder: (context, suggestion) {
                        return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                          context,
                          suggestion,
                          controller.patientTxtField.text,
                        );
                      },
                    ),
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
                    const VerticalSizedBox(35),
                    CustomTextFormField(
                      label: 'Patient name - Auto Full',
                      horizantalPadding: 20,
                      controller: controller.patientNameTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      readOnly: true,
                      showClearIcon: false,
                      validator: Validators.checkIfNotEmpty,
                      onSaved: (value) {
                        // _signupModel = _signupModel.copyWith(name: value);
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(25),
                    SelectItemButton(
                      title: 'Multiple booking',
                      iconOnEnd: true,
                      iconColor: ColorsConstant.green1,
                      onTab: () {},
                    ),
                    const VerticalSizedBox(25),
                    Row(
                      children: [
                        const HorizantalSizedBox(20),
                        Expanded(
                          child: CustomTextFormField(
                            label: 'Start time',
                            controller: controller.startTimeTxtField,
                            textInputType: TextInputType.datetime,
                            textInputAction: TextInputAction.next,
                            validator: Validators.validateTimeFormat,
                            onTap: () async {
                              controller.startTimeTxtField.text =
                                  await ShowDateTimePickers
                                      .showCustomTimePicker(
                                          controller.startTimeTxtField.text);
                            },
                            showSuffix: false,
                            onSaved: (value) {
                              // _signupModel = _signupModel.copyWith(name: value);
                            },
                            showlable: false,
                            showHint: true,
                          ),
                        ),
                        const HorizantalSizedBox(4),
                        Expanded(
                          child: CustomTextFormField(
                            label: 'End time',
                            controller: controller.endTimeTxtField,
                            textInputType: TextInputType.datetime,
                            textInputAction: TextInputAction.next,
                            validator: Validators.validateTimeFormat,
                            showSuffix: false,
                            onTap: () async {
                              controller.endTimeTxtField.text =
                                  await ShowDateTimePickers
                                      .showCustomTimePicker(
                                          controller.endTimeTxtField.text);
                            },
                            onSaved: (value) {
                              // _signupModel = _signupModel.copyWith(name: value);
                            },
                            showlable: false,
                            showHint: true,
                          ),
                        ),
                        const HorizantalSizedBox(20),
                      ],
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Description of the disease',
                      horizantalPadding: 20,
                      controller: controller.diseaseDescriptionTxtField,
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      validator: Validators.checkIfNotEmpty,
                      minLines: 4,
                      onSaved: (value) {
                        // _signupModel = _signupModel.copyWith(name: value);
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(60),
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
