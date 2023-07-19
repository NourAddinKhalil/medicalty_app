import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/views/auth/screens/create_account_screen.dart';
import 'package:medicalty/views/auth/screens/forget_password_screen.dart';
import 'package:medicalty/views/auth/widgets/google_login_btn.dart';
import 'package:medicalty/views/main/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTxtField = TextEditingController();
  final passwordTxtField = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      emailTxtField.text = 'test@test.com';
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
    emailTxtField.dispose();
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
            saveButtonText: 'Login',
            paddingHorizantal: 30,
            childrenAfterSaveButton: [
              const VerticalSizedBox(35),
              Text(
                'Or Login with',
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
              const VerticalSizedBox(20),
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
                      text: "Register!",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const CreateAccountScreen());
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
              const VerticalSizedBox(50),
              // ImageHelpers.getSVGAssetImage(
              //   182,
              //   182,
              //   pic: Assets.logos.logoWhole,
              // ),
              // const VerticalSizedBox(5),
              Text(
                "Welcome to Pro Dector!",
                style: FontSizes.h4?.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const VerticalSizedBox(25),
              Text(
                "Hello there, sign in to continue!",
                style: FontSizes.h7?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const VerticalSizedBox(45),
              // Email
              CustomTextFormField(
                label: 'Email',
                controller: emailTxtField,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Validators.validateEmail,
                icon: Icons.check,
                onSaved: (value) {
                  // _signupModel = _signupModel.copyWith(companyName: value);
                },
                height: null,
                showHint: true,
                showlable: false,
              ),
              const VerticalSizedBox(20),
              // Password
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
              const VerticalSizedBox(15),
              // Forgot Password?
              RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                    text: 'Forgot Password?',
                    style: FontSizes.h7?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorsConstant.green2,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => const ForgetPasswordScreen());
                      }),
              ),
              const VerticalSizedBox(30),
            ],
          ),
        ),
      ),
    );
  }
}
