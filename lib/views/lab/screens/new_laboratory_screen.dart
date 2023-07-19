import 'package:flutter/material.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';

class NewLaboratoryScreen extends StatefulWidget {
  const NewLaboratoryScreen({super.key});

  @override
  State<NewLaboratoryScreen> createState() => _NewLaboratoryScreenState();
}

class _NewLaboratoryScreenState extends State<NewLaboratoryScreen> {
  final passwordTxtField = TextEditingController();
  final websiteTxtField = TextEditingController();
  final workingTimeTxtField = TextEditingController();
  final phoneNumberTxtField = TextEditingController();
  final emailTxtField = TextEditingController();
  final nameTxtField = TextEditingController();
  final addressTxtField = TextEditingController();

  Future<void> save() async {}

  @override
  void dispose() {
    websiteTxtField.dispose();
    workingTimeTxtField.dispose();
    passwordTxtField.dispose();
    phoneNumberTxtField.dispose();
    emailTxtField.dispose();
    nameTxtField.dispose();
    addressTxtField.dispose();
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
            title: 'New Laboratory',
          ),
          body: SafeArea(
            child: CustomForm(
              saveButtonText: 'Create Laboratory',
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
                  '#ID laboratory',
                  textAlign: TextAlign.center,
                  style: FontSizes.h7?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorsConstant.primaryColor,
                  ),
                ),
                const VerticalSizedBox(35),
                CustomTextFormField(
                  label: 'Laboratory Name',
                  horizantalPadding: 20,
                  controller: nameTxtField,
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
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Address',
                  horizantalPadding: 20,
                  controller: addressTxtField,
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
                  label: 'phone number',
                  horizantalPadding: 20,
                  controller: phoneNumberTxtField,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validatePhoneNumberField,
                  icon: Icons.phone_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'E-mail',
                  horizantalPadding: 20,
                  controller: emailTxtField,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateEmail,
                  icon: Icons.email_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'website',
                  controller: websiteTxtField,
                  horizantalPadding: 20,
                  textInputType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateURL,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'password',
                  controller: passwordTxtField,
                  horizantalPadding: 20,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validatePasswordField,
                  obscureText: true,
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
