import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/gen/fonts.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

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
            pic: Assets.images.onPording3Back.path,
            boxFit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 50.h,
          right: 10.w,
          left: 10.w,
          child: ImageHelpers.getAssetImage(
            350,
            420,
            pic: Assets.images.woman3.path,
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
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Perfect Body \n'.toUpperCase(),
                style: FontSizes.h1?.copyWith(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.bebasNeue,
                  letterSpacing: 1,
                ),
                children: [
                  TextSpan(
                    text: 'Doing '.toUpperCase(),
                    style: FontSizes.h1?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.bebasNeue,
                      letterSpacing: 1,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Crossfit\n'.toUpperCase(),
                        style: FontSizes.h1?.copyWith(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamily.bebasNeue,
                          letterSpacing: 1,
                          color: const Color(0xFFB0C929),
                        ),
                      )
                    ],
                  ),
                  TextSpan(
                    text: ' Exercises'.toUpperCase(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
