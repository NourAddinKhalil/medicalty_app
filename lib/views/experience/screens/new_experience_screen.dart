import 'package:flutter/material.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
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

class NewExperienceScreen extends StatefulWidget {
  const NewExperienceScreen({Key? key}) : super(key: key);

  @override
  State<NewExperienceScreen> createState() => _NewExperienceScreenState();
}

class _NewExperienceScreenState extends State<NewExperienceScreen> {
  final topOfWorkTxtField = TextEditingController();
  final beginningWorkTxtField = TextEditingController();
  final workIsFinishedTxtField = TextEditingController();
  final workPlaceCountryTxtField = TextEditingController();
  final experienceNameTxtField = TextEditingController();
  final placeNameTxtField = TextEditingController();

  Future<void> save() async {}

  @override
  void dispose() {
    workPlaceCountryTxtField.dispose();
    beginningWorkTxtField.dispose();
    workIsFinishedTxtField.dispose();
    topOfWorkTxtField.dispose();
    experienceNameTxtField.dispose();
    placeNameTxtField.dispose();
    super.dispose();
  }

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
            child: CustomForm(
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
                    index: 0,
                    imageHandeler: (index, image) {
                      //
                    },
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
                  controller: experienceNameTxtField,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: Validators.checkIfNotEmpty,
                  icon: Icons.play_lesson_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Name of the place',
                  horizantalPadding: 20,
                  controller: placeNameTxtField,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: Validators.checkIfNotEmpty,
                  icon: Icons.business,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Work place country',
                  controller: workPlaceCountryTxtField,
                  horizantalPadding: 20,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: Validators.checkIfNotEmpty,
                  icon: Icons.place_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Beginning work',
                  controller: beginningWorkTxtField,
                  horizantalPadding: 20,
                  readOnly: true,
                  textInputType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateDateFormat,
                  icon: Icons.calendar_month_outlined,
                  onTap: () async {
                    beginningWorkTxtField.text =
                        await ShowDateTimePickers.showCustomDatePicker(
                            beginningWorkTxtField.text);
                  },
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'work is finished',
                  controller: workIsFinishedTxtField,
                  horizantalPadding: 20,
                  readOnly: true,
                  textInputType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateDateFormat,
                  icon: Icons.calendar_month_outlined,
                  onTap: () async {
                    workIsFinishedTxtField.text =
                        await ShowDateTimePickers.showCustomDatePicker(
                            workIsFinishedTxtField.text);
                  },
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextField(
                  title: 'Is he on top of his work.',
                  hintText: 'Is he on top of his work.',
                  horizantalPadding: 20,
                  showHint: true,
                  showlable: false,
                  textController: topOfWorkTxtField,
                  suggestionCallback: (val) {
                    return [];
                  },
                  fieldList: const [],
                  onSuggestionSelected: (selected) {},
                  itemBuilder: (context, suggestion) {
                    return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                      context,
                      suggestion,
                      topOfWorkTxtField.text,
                    );
                  },
                ),
                const VerticalSizedBox(60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
