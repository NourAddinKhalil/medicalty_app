import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_field.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/views/auth/screens/login_screen.dart';
import 'package:medicalty/views/auth/widgets/google_login_btn.dart';
import 'package:medicalty/views/main/screens/main_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final fullNameTxtField = TextEditingController();
  final emailTxtField = TextEditingController();
  final countryTxtField = TextEditingController();
  final specialtyTxtField = TextEditingController();
  final passwordTxtField = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      emailTxtField.text = 'test@test.com';
      fullNameTxtField.text = 'test';
      countryTxtField.text = 'USA';
      specialtyTxtField.text = 'Pharmacist';
      passwordTxtField.text = '12345678';
    }
  }

  Future<void> save() async {
    Get.to(() => const MainScreen());
    // Get.to(const MainScreen());
    // await Get.find<AuthController>().companySignup(_signupModel, after: () {
    //   Get.offNamedUntil(
    //     AppRouter.homeRoute,
    //     (route) => false,
    //   );
    // });
  }

  @override
  void dispose() {
    fullNameTxtField.dispose();
    emailTxtField.dispose();
    countryTxtField.dispose();
    specialtyTxtField.dispose();
    passwordTxtField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppbar(title: ''),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomForm(
            saveButtonText: 'Create Account',
            paddingHorizantal: 30,
            childrenAfterSaveButton: [
              const VerticalSizedBox(25),
              Text(
                'Or Register with',
                textAlign: TextAlign.center,
                style: FontSizes.h8?.copyWith(
                  color: ColorsConstant.primaryColor,
                ),
              ),
              const VerticalSizedBox(20),
              // sign with google
              GoogleLoginBtn(
                title: 'Login with google',
                imagePath: Assets.icons.googleLogo,
                isSVG: true,
                onTab: () {},
              ),
              const VerticalSizedBox(25),
              GoogleLoginBtn(
                title: 'Connect With Facebook',
                imagePath: Assets.icons.facebookLogo,
                backgroundColor: ColorsConstant.facebookColor,
                isSVG: true,
                textStyle: FontSizes.h8?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                onTab: () {},
              ),
              const VerticalSizedBox(30),
              // Already have an account?
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: FontSizes.h7?.copyWith(
                    color: ColorsConstant.black,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: "login!",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const LoginScreen());
                        },
                      style: FontSizes.h7?.copyWith(
                        color: ColorsConstant.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSizedBox(15),
            ],
            save: save,
            children: [
              // const VerticalSizedBox(70),
              // ImageHelpers.getSVGAssetImage(
              //   182,
              //   182,
              //   pic: Assets.logos.logoWhole,
              // ),
              // const VerticalSizedBox(5),
              Text(
                "Create Account",
                style: FontSizes.h3?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const VerticalSizedBox(8),
              Text(
                "Please enter your credentials to \nproceed",
                style: FontSizes.h7?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const VerticalSizedBox(25),
              CustomTextFormField(
                label: 'Full name',
                controller: fullNameTxtField,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: Validators.checkIfNotEmpty,
                icon: Icons.check,
                onSaved: (value) {
                  // _signupModel = _signupModel.copyWith(name: value);
                },
                showHint: true,
                showlable: false,
              ),
              const VerticalSizedBox(15),
              CustomTextFormField(
                label: 'Email',
                controller: emailTxtField,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Validators.validateEmail,
                icon: Icons.email_outlined,
                onSaved: (value) {
                  // _signupModel = _signupModel.copyWith(companyName: value);
                },
                height: null,
                showHint: true,
                showlable: false,
              ),
              const VerticalSizedBox(15),
              CustomTextFormField(
                label: 'Country',
                controller: countryTxtField,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: Validators.checkIfNotEmpty,
                icon: Icons.business_outlined,
                onSaved: (value) {
                  // _signupModel = _signupModel.copyWith(email: value);
                },
                showHint: true,
                showlable: false,
              ),
              const VerticalSizedBox(15),
              CustomTextField(
                title: 'Your Specialty',
                showHint: true,
                showlable: false,
                controller: specialtyTxtField,
                typeName: 'specialty',
                suggestionCallback: (val) {
                  return [];
                },
                fieldList: const ['Pharmacist'],
                onSuggestionSelected: (selected) {},
                itemBuilder: (context, suggestion) {
                  return const SizedBox();
                },
              ),
              const VerticalSizedBox(15),
              CustomTextFormField(
                label: 'password',
                controller: passwordTxtField,
                obscureText: true,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                validator: Validators.validatePasswordField,
                onSaved: (value) {
                  // _signupModel = _signupModel.copyWith(password: value);
                },
                showHint: true,
                showlable: false,
              ),
              const VerticalSizedBox(25),
            ],
          ),
        ),
      ),
    );
  }
}
