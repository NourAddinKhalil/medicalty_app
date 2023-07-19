import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/gen/fonts.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/views/auth/screens/verify_account_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailTxtField = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      emailTxtField.text = 'test@test.com';
    }
  }

  Future<void> save() async {
    Get.to(() => const VerifyAccountScreen());
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
            saveButtonText: 'Reset Password'.toUpperCase(),
            saveStyle: ElevatedButton.styleFrom(
              textStyle: FontSizes.h4?.copyWith(
                fontSize: 22.sp,
                fontFamily: FontFamily.bebasNeue,
                fontWeight: FontWeight.w500,
              ),
            ),
            paddingHorizantal: 30,
            childrenAfterSaveButton: const [
              VerticalSizedBox(35),
            ],
            save: save,
            children: [
              const VerticalSizedBox(70),
              // ImageHelpers.getSVGAssetImage(
              //   182,
              //   182,
              //   pic: Assets.logos.logoWhole,
              // ),
              // const VerticalSizedBox(5),
              Text(
                "Forgot Password",
                style: FontSizes.h3?.copyWith(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VerticalSizedBox(10),
              Text(
                "Please enter your email below to receive \nyour password reset code.",
                style: FontSizes.h7?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const VerticalSizedBox(85),
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
              const VerticalSizedBox(100),
            ],
          ),
        ),
      ),
    );
  }
}
