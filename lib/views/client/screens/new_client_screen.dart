import 'package:flutter/material.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/enums.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_suggestion_helpers.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_field.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';

class NewClientScreen extends StatefulWidget {
  const NewClientScreen({super.key});

  @override
  State<NewClientScreen> createState() => _NewClientScreenState();
}

class _NewClientScreenState extends State<NewClientScreen> {
  final firstNameTxtField = TextEditingController();
  final personPrefixTxtField = TextEditingController();
  final lastNameTxtField = TextEditingController();
  final companyTxtField = TextEditingController();
  final phoneTxtField = TextEditingController();
  final phoneTypeTxtField = TextEditingController();
  final emailTxtField = TextEditingController();
  final emailTypeTxtField = TextEditingController();
  final attributedToTxtField = TextEditingController();
  final addressTxtField = TextEditingController();
  final address2TxtField = TextEditingController();
  final cityTxtField = TextEditingController();
  final inturuptTxtField = TextEditingController();
  final zipCodeTxtField = TextEditingController();
  final countryTxtField = TextEditingController();
  Future<void> save() async {}

  @override
  void dispose() {
    firstNameTxtField.dispose();
    personPrefixTxtField.dispose();
    lastNameTxtField.dispose();
    phoneTxtField.dispose();
    phoneTypeTxtField.dispose();
    companyTxtField.dispose();
    emailTxtField.dispose();
    emailTypeTxtField.dispose();
    attributedToTxtField.dispose();
    countryTxtField.dispose();
    addressTxtField.dispose();
    address2TxtField.dispose();
    cityTxtField.dispose();
    inturuptTxtField.dispose();
    zipCodeTxtField.dispose();
    super.dispose();
  }

  Widget _buildTextFieldHelper(Widget first, Widget second) {
    return Row(
      children: [
        first,
        const HorizantalSizedBox(6),
        Flexible(
          flex: 3,
          child: second,
        ),
      ],
    );
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
            title: 'Create Clients',
          ),
          body: SafeArea(
            child: CustomForm(
              paddingHorizantal: 20,
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
                  '#ID Client',
                  textAlign: TextAlign.center,
                  style: FontSizes.h7?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorsConstant.primaryColor,
                  ),
                ),
                const VerticalSizedBox(35),
                _buildTextFieldHelper(
                  CustomTextField<EmailTypesEnum>(
                    title: '',
                    width: 120,
                    showlable: false,
                    showClearIcon: false,
                    showHint: false,
                    textController: personPrefixTxtField,
                    suggestionCallback: (val) {
                      return EmailTypesEnum.values;
                    },
                    fieldList: EmailTypesEnum.values,
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
                  CustomTextFormField(
                    label: 'First Name',
                    controller: firstNameTxtField,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: Validators.checkIfNotEmpty,
                    icon: Icons.contacts_outlined,
                    onSaved: (value) {
                      // _signupModel = _signupModel.copyWith(name: value);
                    },
                    showlable: false,
                    showHint: true,
                  ),
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Second and last name',
                  controller: lastNameTxtField,
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
                  label: 'Company Name',
                  showlable: false,
                  showHint: true,
                  controller: companyTxtField,
                  textInputType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validatePhoneNumberField,
                  icon: Icons.phone_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                _buildTextFieldHelper(
                  CustomTextField<EmailTypesEnum>(
                    title: '',
                    width: 120,
                    showlable: false,
                    showClearIcon: false,
                    showHint: false,
                    textController: phoneTypeTxtField,
                    suggestionCallback: (val) {
                      return EmailTypesEnum.values;
                    },
                    fieldList: EmailTypesEnum.values,
                    onSuggestionSelected: (selected) {
                      phoneTypeTxtField.text = selected.name;
                    },
                    itemBuilder: (context, suggestion) {
                      return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                        context,
                        suggestion.name,
                        phoneTypeTxtField.text,
                      );
                    },
                  ),
                  CustomTextFormField(
                    label: 'Phone Number',
                    controller: phoneTxtField,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validator: Validators.validatePhoneNumberField,
                    icon: Icons.phone_outlined,
                    onSaved: (value) {
                      // _signupModel = _signupModel.copyWith(name: value);
                    },
                    showlable: false,
                    showHint: true,
                  ),
                ),
                const VerticalSizedBox(15),
                _buildTextFieldHelper(
                  CustomTextField<EmailTypesEnum>(
                    title: '',
                    showClearIcon: false,
                    width: 120,
                    showlable: false,
                    showHint: false,
                    textController: emailTypeTxtField,
                    suggestionCallback: (val) {
                      return EmailTypesEnum.values;
                    },
                    fieldList: EmailTypesEnum.values,
                    onSuggestionSelected: (selected) {
                      emailTypeTxtField.text = selected.name;
                    },
                    itemBuilder: (context, suggestion) {
                      return CustomSuggestionHelpers.itemPrimativTypesBuilder(
                        context,
                        suggestion.name,
                        emailTypeTxtField.text,
                      );
                    },
                  ),
                  CustomTextFormField(
                    label: 'E-mail',
                    showlable: false,
                    showHint: true,
                    controller: emailTxtField,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: Validators.validateEmail,
                    icon: Icons.email_outlined,
                    onSaved: (value) {
                      // _signupModel = _signupModel.copyWith(name: value);
                    },
                  ),
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Attributed to',
                  showlable: false,
                  showHint: true,
                  controller: attributedToTxtField,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: Validators.checkIfNotEmpty,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Customer Address',
                  showlable: false,
                  showHint: true,
                  controller: addressTxtField,
                  textInputType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  validator: null,
                  icon: Icons.location_on_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Customer Address 2',
                  showlable: false,
                  showHint: true,
                  controller: address2TxtField,
                  textInputType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  validator: null,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'City',
                  showlable: false,
                  showHint: true,
                  controller: cityTxtField,
                  textInputType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  validator: null,
                  icon: Icons.location_city_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Inturupt',
                  showlable: false,
                  showHint: true,
                  controller: inturuptTxtField,
                  textInputType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  icon: Icons.flag_outlined,
                  validator: null,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Zip Code',
                  showlable: false,
                  showHint: true,
                  controller: zipCodeTxtField,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: null,
                  icon: Icons.folder_zip_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Country',
                  showlable: false,
                  showHint: true,
                  controller: countryTxtField,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: null,
                  icon: Icons.flag_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
