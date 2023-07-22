import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/request_screen_controller.dart';
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

class NewRequestScreen extends GetView<RequestScreenController> {
  const NewRequestScreen({Key? key}) : super(key: key);

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
            title: 'New Request',
          ),
          body: SafeArea(
            child: GetBuilder<RequestScreenController>(
                init: RequestScreenController(),
                builder: (controller) {
                  return CustomForm(
                    saveButtonText: 'Create Request',
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
                        '#ID Request',
                        textAlign: TextAlign.center,
                        style: FontSizes.h7?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorsConstant.primaryColor,
                        ),
                      ),
                      const VerticalSizedBox(35),
                      CustomTextField(
                        title: 'selection of clients/patients',
                        hintText: 'selection of clients/patients',
                        horizantalPadding: 20,
                        showHint: true,
                        showlable: false,
                        controller: controller.clientTxtField,
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
                            controller.clientTxtField.text,
                          );
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'address of the request',
                        horizantalPadding: 20,
                        controller: controller.requestAddressTxtField,
                        textInputType: TextInputType.streetAddress,
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
                        label: 'Service details',
                        horizantalPadding: 20,
                        controller: controller.serviceDetailsTxtField,
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
                      SelectItemButton(
                        title: 'Appointment, booking schedule',
                        iconOnEnd: true,
                        iconColor: Colors.white,
                        icon: Icons.calendar_month_outlined,
                        onTab: () {
                          // Get.to(() => const MessageScreen());
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'comments',
                        horizantalPadding: 20,
                        controller: controller.commentsTxtField,
                        textInputType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        minLines: 4,
                        validator: null,
                        onSaved: (value) {
                          // _signupModel = _signupModel.copyWith(name: value);
                        },
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(15),
                      CustomTextField(
                        title: 'Reservation times',
                        hintText: 'Reservation times',
                        horizantalPadding: 20,
                        showHint: true,
                        showlable: false,
                        controller: controller.reservationTimesTxtField,
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
                            controller.reservationTimesTxtField.text,
                          );
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Choose the date',
                        controller: controller.dateTxtField,
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
                          controller.dateTxtField.text =
                              await ShowDateTimePickers.showCustomDatePicker(
                                  controller.dateTxtField.text);
                        },
                        showlable: false,
                        showHint: true,
                      ),
                      const VerticalSizedBox(15),
                      CustomTextField(
                        title: 'selection of clients/patients',
                        hintText: 'selection of clients/patients',
                        horizantalPadding: 20,
                        showHint: true,
                        showlable: false,
                        controller: controller.clientPatientsMultiTxtField,
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
                            controller.clientPatientsMultiTxtField.text,
                          );
                        },
                      ),
                      const VerticalSizedBox(15),
                      Row(
                        children: [
                          const HorizantalSizedBox(20),
                          Expanded(
                            child: CustomTextFormField(
                              label: 'Starting Time',
                              controller: controller.startingTimeTxtField,
                              readOnly: true,
                              textInputType: TextInputType.datetime,
                              textInputAction: TextInputAction.next,
                              validator: Validators.validateTimeFormat,
                              showSuffix: false,
                              onSaved: (value) {
                                // _signupModel = _signupModel.copyWith(name: value);
                              },
                              onTap: () async {
                                controller.startingTimeTxtField.text =
                                    await ShowDateTimePickers
                                        .showCustomTimePicker(controller
                                            .startingTimeTxtField.text);
                              },
                              showlable: false,
                              showHint: true,
                            ),
                          ),
                          const HorizantalSizedBox(4),
                          Expanded(
                            child: CustomTextFormField(
                              label: 'Ending Time',
                              controller: controller.endingTimeTxtField,
                              readOnly: true,
                              textInputType: TextInputType.datetime,
                              textInputAction: TextInputAction.next,
                              validator: Validators.validateTimeFormat,
                              showSuffix: false,
                              onSaved: (value) {
                                // _signupModel = _signupModel.copyWith(name: value);
                              },
                              onTap: () async {
                                controller.endingTimeTxtField.text =
                                    await ShowDateTimePickers
                                        .showCustomTimePicker(
                                            controller.endingTimeTxtField.text);
                              },
                              showlable: false,
                              showHint: true,
                            ),
                          ),
                          const HorizantalSizedBox(20),
                        ],
                      ),
                      const VerticalSizedBox(15),
                      CustomTextField(
                        title: 'supervising physician',
                        hintText: 'supervising physician',
                        horizantalPadding: 20,
                        showHint: true,
                        showlable: false,
                        controller: controller.supervisingPhysicianTxtField,
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
                            controller.supervisingPhysicianTxtField.text,
                          );
                        },
                      ),
                      const VerticalSizedBox(15),
                      CustomTextFormField(
                        label: 'Notes',
                        horizantalPadding: 20,
                        controller: controller.notesTxtField,
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
