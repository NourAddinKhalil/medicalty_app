import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/gen/fonts.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_elevated_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';
import 'package:medicalty/views/auth/screens/create_account_screen.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: ImageHelpers.getAssetImage(
            double.maxFinite,
            double.maxFinite,
            pic: Assets.images.onPording2Back.path,
            boxFit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 30.h,
          right: 10.w,
          left: 10.w,
          child: ImageHelpers.getAssetImage(
            500,
            450,
            pic: Assets.images.women2.path,
            boxFit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 523.h,
          left: 25.w,
          right: 25.w,
          child: SizedBox(
            width: 289.w,
            // height: 89.h,
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Pro Doctors\n',
                    style: FontSizes.h1?.copyWith(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFB0C929),
                    ),
                    children: [
                      TextSpan(
                        text: 'Run the medical center \nprofessionally',
                        style: FontSizes.h6?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSizedBox(30),
                CustomElevatedButton(
                  title: 'Let\'s Start',
                  style: ElevatedButton.styleFrom(
                    padding: CustomEdgeInsets.symmetric(15, 40),
                    textStyle: FontSizes.h5?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.bebasNeue,
                    ),
                  ),
                  onPressed: () {
                    Get.offUntil(
                      GetPageRoute(
                        page: () => const CreateAccountScreen(),
                      ),
                      (route) => false,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
