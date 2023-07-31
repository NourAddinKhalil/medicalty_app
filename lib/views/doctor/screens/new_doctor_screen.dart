import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/api_controllers/department_controller.dart';
import 'package:medicalty/controllers/screen_controllers/doctor_screen_controller.dart';
import 'package:medicalty/helpers/convert_to_date_time.dart';
import 'package:medicalty/helpers/enums.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/image_string_helpers.dart';
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

class NewDoctorScreen extends GetView<DoctorScreenController> {
  const NewDoctorScreen({super.key});

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
            title: 'New Doctor',
          ),
          body: SafeArea(
            child: GetBuilder<DoctorScreenController>(
              init: DoctorScreenController(),
              builder: (controller) {
                return CustomForm(
                  paddingHorizantal: 20,
                  childrenAfterSaveButton: const [
                    VerticalSizedBox(15),
                  ],
                  saveButtonText: 'Create Doctor',
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
                      '#ID Doctor',
                      textAlign: TextAlign.center,
                      style: FontSizes.h7?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorsConstant.primaryColor,
                      ),
                    ),
                    const VerticalSizedBox(35),
                    GetBuilder<DepartmentController>(
                      builder: (deptCtrl) {
                        return CustomTextField(
                          title: 'Choose department',
                          hintText: 'Choose department',
                          showlable: false,
                          showHint: true,
                          controller: controller.departmentTxtField,
                          suggestionCallback: (query) async {
                            final resList = await deptCtrl.get();
                            final res = resList.where((element) {
                              return element.name
                                  .toLowerCase()
                                  .contains(query.toLowerCase());
                            }).toList();
                            return res;
                          },
                          fieldList: null,
                          onSuggestionSelected: controller.onDepartmentSelected,
                          itemBuilder: (context, suggestion) {
                            return CustomSuggestionHelpers
                                .itemPrimativTypesBuilder(
                              context,
                              suggestion.name,
                              controller.departmentTxtField.text,
                            );
                          },
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextField(
                      title: 'Choose job',
                      hintText: 'Choose job',
                      showlable: false,
                      showHint: true,
                      controller: controller.jobTxtField,
                      suggestionCallback: (val) {
                        return [];
                      },
                      fieldList: const [],
                      onSuggestionSelected: (selected) {
                        //
                      },
                      itemBuilder: (context, suggestion) {
                        return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                          context,
                          suggestion.name,
                          '',
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: '@username',
                      controller: controller.usernameTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: Validators.checkIfNotEmpty,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          username: value,
                        );
                      },
                      icon: Icons.contacts_outlined,
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Job number',
                      showlable: false,
                      showHint: true,
                      controller: controller.jobNumberTxtField,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: Validators.validateNumberField,
                      icon: Icons.person_outline,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          jobId: int.parse(value!),
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Full name',
                      controller: controller.fullNameTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: Validators.checkIfNotEmpty,
                      icon: Icons.person_add_outlined,
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
                      label: 'National ID',
                      showlable: false,
                      showHint: true,
                      controller: controller.nationalIDTxtField,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: Validators.validateNumberField,
                      icon: Icons.contacts_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          ssn: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Job Description',
                      showlable: false,
                      showHint: true,
                      controller: controller.jobDescriptionTxtField,
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 4,
                      validator: Validators.checkIfNotEmpty,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          jobDescription: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'About the doctor',
                      showlable: false,
                      showHint: true,
                      controller: controller.aboutDoctorTxtField,
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 4,
                      validator: Validators.checkIfNotEmpty,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          fullBrief: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Comprehensive profile doctor',
                      showlable: false,
                      showHint: true,
                      controller: controller.comprehensiveprofileTxtField,
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 5,
                      validator: Validators.checkIfNotEmpty,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          abstract: value,
                        );
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
                        controller.model = controller.model.copyWith(
                          birthDate:
                              DateTimeHelpers.convertStringToDate(value!),
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Years of Experience',
                      showlable: false,
                      showHint: true,
                      controller: controller.yearsOfExperienceTxtField,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      icon: Icons.star_outline,
                      validator: Validators.validateNumberField,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          experienceYears: int.parse(value!),
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Experience',
                      showlable: false,
                      showHint: true,
                      controller: controller.experienceTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: Validators.checkIfNotEmpty,
                      icon: Icons.bar_chart_outlined,
                      onSaved: (value) {
                        // controller.model =
                        //       controller.model.copyWith(: value,);
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
                        controller.model = controller.model.copyWith(
                          phone: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Work phone number',
                      showlable: false,
                      showHint: true,
                      controller: controller.workPhoneNumberTxtField,
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      validator: Validators.validatePhoneNumberField,
                      icon: Icons.phone_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          workPhone: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'E-mail',
                      showlable: false,
                      showHint: true,
                      controller: controller.emailTxtField,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: Validators.validateEmail,
                      icon: Icons.email_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          email: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Work email',
                      showlable: false,
                      showHint: true,
                      controller: controller.workEmailTxtField,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: Validators.validateEmail,
                      icon: Icons.email_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          workEmail: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextField<GenderEnum>(
                      title: 'Gender',
                      hintText: 'Gender',
                      showlable: false,
                      showHint: true,
                      controller: controller.genderTxtField,
                      suggestionCallback: (val) {
                        return GenderEnum.values;
                      },
                      fieldList: GenderEnum.values,
                      onSuggestionSelected: controller.onGenderSelected,
                      itemBuilder: (context, suggestion) {
                        return CustomSuggestionHelpers.itemPrimativTypesBuilder(
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
                        return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                          context,
                          suggestion.name,
                          controller.nationaltyTxtField.text,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'address',
                      showlable: false,
                      showHint: true,
                      controller: controller.addressTxtField,
                      textInputType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      validator: Validators.checkIfNotEmpty,
                      icon: Icons.location_on_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          address: value,
                        );
                      },
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'salary',
                      showlable: false,
                      showHint: true,
                      controller: controller.salaryTxtField,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: Validators.validateMoneyField,
                      icon: Icons.attach_money_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          salary: double.parse(value!),
                        );
                      },
                    ),
                    const VerticalSizedBox(30),
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
