import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

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
            pic: Assets.images.onPording1Back.path,
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
            pic: Assets.images.woman1.path,
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
                text: 'Shot Strong\n',
                style: FontSizes.h1?.copyWith(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Pro Doctors\n',
                    style: FontSizes.h1?.copyWith(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFB0C929),
                    ),
                  ),
                  const TextSpan(
                    text: 'Medical',
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
