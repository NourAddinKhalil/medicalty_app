import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/experience_screen_controller.dart';
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

class NewExperienceScreen extends StatelessWidget {
  const NewExperienceScreen({Key? key}) : super(key: key);

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
            title: 'New Experience',
          ),
          body: SafeArea(
            child: GetBuilder<ExperienceScreenController>(
              init: ExperienceScreenController(),
              builder: (controller) {
                return CustomForm(
                  saveButtonText: 'Create Experience',
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
                        allowedExtensions: ImageStringHelpers.imagesExtensions,
                        showChooseDocument: false,
                        showChooseVideo: false,
                        image: controller.image,
                        onImageChoosen: controller.onImageChoosen,
                      ),
                    ),
                    const VerticalSizedBox(15),
                    Text(
                      '#ID Experience',
                      textAlign: TextAlign.center,
                      style: FontSizes.h7?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorsConstant.primaryColor,
                      ),
                    ),
                    const VerticalSizedBox(35),
                    CustomTextFormField(
                      label: 'Name of the experience',
                      horizantalPadding: 20,
                      controller: controller.experienceNameTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: Validators.checkIfNotEmpty,
                      icon: Icons.play_lesson_outlined,
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
                      label: 'Name of the place',
                      horizantalPadding: 20,
                      controller: controller.placeNameTxtField,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: Validators.checkIfNotEmpty,
                      icon: Icons.business,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          placeName: value,
                        );
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Work place country',
                      controller: controller.workPlaceCountryTxtField,
                      horizantalPadding: 20,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: Validators.checkIfNotEmpty,
                      icon: Icons.place_outlined,
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          placeCountry: value,
                        );
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'Beginning work',
                      controller: controller.beginningWorkTxtField,
                      horizantalPadding: 20,
                      readOnly: true,
                      textInputType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      validator: Validators.validateDateFormat,
                      icon: Icons.calendar_month_outlined,
                      onTap: () async {
                        controller.beginningWorkTxtField.text =
                            await ShowDateTimePickers.showCustomDatePicker(
                                controller.beginningWorkTxtField.text);
                      },
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          start: DateTimeHelpers.convertStringToDate(value!),
                        );
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(15),
                    CustomTextFormField(
                      label: 'work is finished',
                      controller: controller.workIsFinishedTxtField,
                      horizantalPadding: 20,
                      readOnly: true,
                      textInputType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      validator: Validators.validateDateFormat,
                      icon: Icons.calendar_month_outlined,
                      onTap: () async {
                        controller.workIsFinishedTxtField.text =
                            await ShowDateTimePickers.showCustomDatePicker(
                                controller.workIsFinishedTxtField.text);
                      },
                      onSaved: (value) {
                        controller.model = controller.model.copyWith(
                          end: DateTimeHelpers.convertStringToDate(value!),
                        );
                      },
                      showlable: false,
                      showHint: true,
                    ),
                    const VerticalSizedBox(15),
                    CustomTextField<YesNoEnum>(
                      title: 'Is he on top of his work.',
                      hintText: 'Is he on top of his work.',
                      horizantalPadding: 20,
                      showHint: true,
                      showlable: false,
                      controller: controller.topOfWorkTxtField,
                      suggestionCallback: (val) {
                        return YesNoEnum.values;
                      },
                      fieldList: YesNoEnum.values,
                      onSuggestionSelected: controller.onYesNoSelected,
                      itemBuilder: (context, suggestion) {
                        return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                          context,
                          suggestion.name,
                          controller.topOfWorkTxtField.text,
                        );
                      },
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
