import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/custom_image_viewer.dart';

class AddNewCenterScreen extends StatefulWidget {
  const AddNewCenterScreen({super.key});

  @override
  State<AddNewCenterScreen> createState() => _AddNewCenterScreenState();
}

class _AddNewCenterScreenState extends State<AddNewCenterScreen> {
  final centerNameTxtField = TextEditingController();
  final userNameTxtField = TextEditingController();
  final phoneTxtField = TextEditingController();
  final phone2TxtField = TextEditingController();
  final websiteTxtField = TextEditingController();
  final emailTxtField = TextEditingController();
  final officialEmailTxtField = TextEditingController();
  final countryTxtField = TextEditingController();
  final addressTxtField = TextEditingController();
  final address2TxtField = TextEditingController();
  final stateTxtField = TextEditingController();
  final districtTxtField = TextEditingController();
  final postalCodeTxtField = TextEditingController();
  final facebookTxtField = TextEditingController();
  final twitterTxtField = TextEditingController();
  final instgramTxtField = TextEditingController();
  final linkedinTxtField = TextEditingController();
  final youtubeTxtField = TextEditingController();
  Future<void> save() async {}

  @override
  void dispose() {
    centerNameTxtField.dispose();
    userNameTxtField.dispose();
    phoneTxtField.dispose();
    phone2TxtField.dispose();
    websiteTxtField.dispose();
    emailTxtField.dispose();
    officialEmailTxtField.dispose();
    countryTxtField.dispose();
    addressTxtField.dispose();
    address2TxtField.dispose();
    stateTxtField.dispose();
    districtTxtField.dispose();
    postalCodeTxtField.dispose();
    facebookTxtField.dispose();
    twitterTxtField.dispose();
    instgramTxtField.dispose();
    linkedinTxtField.dispose();
    youtubeTxtField.dispose();
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
            title: 'Center Information',
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
                CustomTextFormField(
                  label: 'Full name',
                  controller: centerNameTxtField,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: Validators.checkIfNotEmpty,
                  icon: Icons.business_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Username',
                  controller: userNameTxtField,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: Validators.checkIfNotEmpty,
                  icon: Icons.person,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                  showlable: false,
                  showHint: true,
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Phone',
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
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Official Phone',
                  showlable: false,
                  showHint: true,
                  controller: phone2TxtField,
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
                  label: 'center Website',
                  showlable: false,
                  showHint: true,
                  controller: websiteTxtField,
                  textInputType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateURL,
                  icon: FontAwesomeIcons.link,
                  iconSize: 18,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
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
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Official E-mail',
                  showlable: false,
                  showHint: true,
                  controller: officialEmailTxtField,
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
                  label: 'Country',
                  showlable: false,
                  showHint: true,
                  controller: countryTxtField,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: null,
                  icon: Icons.location_city_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Address',
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
                  label: 'Address 2',
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
                  label: 'State Name',
                  showlable: false,
                  showHint: true,
                  controller: stateTxtField,
                  textInputType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  validator: null,
                  icon: Icons.flag_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'District Name',
                  showlable: false,
                  showHint: true,
                  controller: districtTxtField,
                  textInputType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  validator: null,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Postal Code',
                  showlable: false,
                  showHint: true,
                  controller: postalCodeTxtField,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: null,
                  icon: Icons.folder_zip_outlined,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(20),
                Text(
                  'Social media links for the center',
                  textAlign: TextAlign.center,
                  style: FontSizes.h7?.copyWith(
                    color: ColorsConstant.primaryColor,
                  ),
                ),
                const VerticalSizedBox(20),
                CustomTextFormField(
                  label: 'Facebook',
                  showlable: false,
                  showHint: true,
                  controller: facebookTxtField,
                  textInputType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateURL,
                  icon: FontAwesomeIcons.facebookF,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Instgram',
                  showlable: false,
                  showHint: true,
                  controller: instgramTxtField,
                  textInputType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateURL,
                  icon: FontAwesomeIcons.instagram,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Twitter',
                  showlable: false,
                  showHint: true,
                  controller: twitterTxtField,
                  textInputType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateURL,
                  icon: FontAwesomeIcons.twitter,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Linkedin',
                  showlable: false,
                  showHint: true,
                  controller: linkedinTxtField,
                  textInputType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateURL,
                  icon: FontAwesomeIcons.linkedin,
                  onSaved: (value) {
                    // _signupModel = _signupModel.copyWith(name: value);
                  },
                ),
                const VerticalSizedBox(15),
                CustomTextFormField(
                  label: 'Youtube',
                  showlable: false,
                  showHint: true,
                  controller: youtubeTxtField,
                  textInputType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateURL,
                  icon: FontAwesomeIcons.squareYoutube,
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
