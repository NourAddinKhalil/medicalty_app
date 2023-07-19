import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_form.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'Profile',
          backOnRightSide: true,
          icon: Icons.arrow_forward_ios,
        ),
        body: SafeArea(
          child: CustomForm(
            save: () async {},
            paddingHorizantal: 24,
            children: [
              const VerticalSizedBox(12),
              CustomTextFormField(
                label: 'Full Name',
                controller: null,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text,
                showUnderlinedStyle: true,
                validator: Validators.checkIfNotEmpty,
                icon: Icons.person_outline,
                fillColor: null,
                onSaved: (value) {
                  // controller.employeeModel =
                  //     controller.employeeModel.copyWith(name: value);
                },
              ),
              const VerticalSizedBox(8),
              CustomTextFormField(
                label: 'Email',
                controller: null,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                showUnderlinedStyle: true,
                fillColor: null,
                validator: Validators.validateEmail,
                icon: Icons.email_outlined,
                onSaved: (value) {
                  // controller.employeeModel =
                  //     controller.employeeModel.copyWith(name: value);
                },
              ),
              const VerticalSizedBox(8),
              CustomTextFormField(
                label: 'Mobile',
                controller: null,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.phone,
                showUnderlinedStyle: true,
                validator: Validators.validatePhoneNumberField,
                icon: Icons.phone_outlined,
                fillColor: null,
                onSaved: (value) {
                  // controller.employeeModel =
                  //     controller.employeeModel.copyWith(name: value);
                },
              ),
              const VerticalSizedBox(20),
              Text(
                'Change password ',
                style: FontSizes.h7?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VerticalSizedBox(15),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      size: 26.sp,
                      color: ColorsConstant.primaryColor,
                    ),
                    const HorizantalSizedBox(8),
                    Text(
                      'Send password reset link to your email!',
                      style: FontSizes.h8?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSizedBox(50),
            ],
          ),
        ),
      ),
    );
  }
}
