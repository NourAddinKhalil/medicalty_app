import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/patient_screen_controller.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/show_date_time_picker.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_suggestion_helpers.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_field.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';

class NewPatientScreen extends GetView<PatientScreenController> {
  const NewPatientScreen({super.key});

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
            title: 'Registration Patient',
          ),
          body: SafeArea(
            child: GetBuilder<PatientScreenController>(
                init: PatientScreenController(),
                builder: (controller) {
                  return CustomForm(
                    paddingHorizantal: 20,
                    childrenAfterSaveButton: const [
                      VerticalSizedBox(15),
                    ],
                    saveButtonText: 'Create Patient',
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
                        '#ID Patient',
                        textAlign: TextAlign.center,
                        style: FontSizes.h7?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorsConstant.primaryColor,
                        ),
                      ),
                      const VerticalSizedBox(35),
                      CustomTextFormField(
                        label: 'Full name',
                        controller: controller.fullNameTxtField,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: Validators.checkIfNotEmpty,
                        icon: Icons.person_add_outlined,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: '@username',
                        controller: controller.usernameTxtField,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: Validators.checkIfNotEmpty,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                        icon: Icons.contacts_outlined,
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'File No.',
                        showlable: false,
                        showHint: true,
                        controller: controller.fileNoTxtField,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateNumberField,
                        icon: Icons.person_outline,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Date of birth',
                        showlable: false,
                        showHint: true,
                        controller: controller.birthDateTxtField,
                        textInputType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateDateFormat,
                        icon: Icons.calendar_month_outlined,
                        onTap: () async {
                          controller.birthDateTxtField.text =
                              await ShowDateTimePickers.showCustomDatePicker(
                                  controller.birthDateTxtField.text);
                        },
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'National ID',
                        showlable: false,
                        showHint: true,
                        controller: controller.nationalIDTxtField,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateNumberField,
                        icon: Icons.contacts_outlined,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'phone number',
                        showlable: false,
                        showHint: true,
                        controller: controller.phoneNumberTxtField,
                        textInputType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validatePhoneNumberField,
                        icon: Icons.phone_outlined,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Patient Email',
                        showlable: false,
                        showHint: true,
                        controller: controller.emailTxtField,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateEmail,
                        icon: Icons.email_outlined,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Home adress',
                        showlable: false,
                        showHint: true,
                        controller: controller.addressTxtField,
                        textInputType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.next,
                        validator: Validators.checkIfNotEmpty,
                        icon: Icons.location_on_outlined,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'patient\'s height CM',
                        showlable: false,
                        showHint: true,
                        controller: controller.patientHeightCMTxtField,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateNumberField,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Patient weight KG',
                        showlable: false,
                        showHint: true,
                        controller: controller.patientWeightKGTxtField,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateNumberField,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextField(
                        title: 'blood type',
                        hintText: 'blood type',
                        showlable: false,
                        showHint: true,
                        controller: controller.bloodTypeTxtField,
                        suggestionCallback: (val) {
                          return [];
                        },
                        fieldList: const [],
                        onSuggestionSelected: (selected) {
                          //
                        },
                        itemBuilder: (context, suggestion) {
                          return CustomSuggestionHelpers
                              .itemPrimativTypesBuilder(
                            context,
                            suggestion.name,
                            controller.bloodTypeTxtField.text,
                          );
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Chose name of the disease',
                        showlable: false,
                        showHint: true,
                        controller: controller.diseaseNameTxtField,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: Validators.checkIfNotEmpty,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Description of the disease',
                        showlable: false,
                        showHint: true,
                        controller: controller.diseaseDescriptionTxtField,
                        textInputType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        minLines: 5,
                        validator: Validators.checkIfNotEmpty,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextField(
                        title: 'Gender',
                        hintText: 'Gender',
                        showlable: false,
                        showHint: true,
                        controller: controller.genderTxtField,
                        suggestionCallback: (val) {
                          return [];
                        },
                        fieldList: const [],
                        onSuggestionSelected: (selected) {
                          //
                        },
                        itemBuilder: (context, suggestion) {
                          return CustomSuggestionHelpers
                              .itemPrimativTypesBuilder(
                            context,
                            suggestion.name,
                            controller.genderTxtField.text,
                          );
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextField(
                        title: 'Nationality',
                        hintText: 'Nationality',
                        showlable: false,
                        showHint: true,
                        controller: controller.nationaltyTxtField,
                        suggestionCallback: (val) {
                          return [];
                        },
                        fieldList: const [],
                        onSuggestionSelected: (selected) {
                          //
                        },
                        itemBuilder: (context, suggestion) {
                          return CustomSuggestionHelpers
                              .itemPrimativTypesBuilder(
                            context,
                            suggestion.name,
                            controller.nationaltyTxtField.text,
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
