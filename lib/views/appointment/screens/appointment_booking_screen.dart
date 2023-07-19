import 'package:flutter/material.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
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

class AppointmentBookingScreen extends StatefulWidget {
  const AppointmentBookingScreen({super.key});

  @override
  State<AppointmentBookingScreen> createState() =>
      _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  final doctorTxtField = TextEditingController();
  final patientTxtField = TextEditingController();
  final endTimeTxtField = TextEditingController();
  final startTimeTxtField = TextEditingController();
  final doctorJobNumberTxtField = TextEditingController();
  final doctorNameTxtField = TextEditingController();
  final patientNameTxtField = TextEditingController();
  final diseaseDescriptionTxtField = TextEditingController();

  Future<void> save() async {}

  @override
  void dispose() {
    startTimeTxtField.dispose();
    endTimeTxtField.dispose();
    doctorTxtField.dispose();
    patientTxtField.dispose();
    doctorJobNumberTxtField.dispose();
    doctorNameTxtField.dispose();
    patientNameTxtField.dispose();
    diseaseDescriptionTxtField.dispose();
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
            title: 'Appointment booking',
          ),
          body: SafeArea(
            child: CustomForm(
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
                  textController: doctorTxtField,
                  suggestionCallback: (val) {
                    return [];
                  },
                  fieldList: const [],
                  onSuggestionSelected: (selected) {},
                  itemBuilder: (context, suggestion) {
                    return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                      context,
                      suggestion,
                      doctorTxtField.text,
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
                  controller: doctorJobNumberTxtField,
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
                  controller: doctorNameTxtField,
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
                  textController: patientTxtField,
                  suggestionCallback: (val) {
                    return [];
                  },
                  fieldList: const [],
                  onSuggestionSelected: (selected) {},
                  itemBuilder: (context, suggestion) {
                    return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                      context,
                      suggestion,
                      patientTxtField.text,
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
                  controller: patientNameTxtField,
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
                        controller: startTimeTxtField,
                        textInputType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateTimeFormat,
                        onTap: () async {
                          startTimeTxtField.text =
                              await ShowDateTimePickers.showCustomTimePicker(
                                  startTimeTxtField.text);
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
                        controller: endTimeTxtField,
                        textInputType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateTimeFormat,
                        showSuffix: false,
                        onTap: () async {
                          endTimeTxtField.text =
                              await ShowDateTimePickers.showCustomTimePicker(
                                  endTimeTxtField.text);
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
                  controller: diseaseDescriptionTxtField,
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
            ),
          ),
        ),
      ),
    );
  }
}
