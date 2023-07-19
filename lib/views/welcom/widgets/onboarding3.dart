import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/gen/fonts.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

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
            pic: Assets.images.onPording4Back.path,
            boxFit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 200.h,
          right: 40.w,
          // left: 200.w,
          child: ImageHelpers.getSVGAssetImage(
            86,
            92,
            pic: Assets.svgs.disease,
            boxFit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 523.h,
          left: 25.w,
          right: 25.w,
          child: SizedBox(
            // width: 289.w,
            // height: 89.h,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Healthy Muscular\n'.toUpperCase(),
                style: FontSizes.h1?.copyWith(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.bebasNeue,
                  letterSpacing: 1,
                ),
                children: [
                  TextSpan(
                    text: ' Sportswoman\n'.toUpperCase(),
                    style: FontSizes.h1?.copyWith(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.bebasNeue,
                      letterSpacing: 1,
                      color: const Color(0xFFB0C929),
                    ),
                  ),
                  TextSpan(
                    text: 'Standing'.toUpperCase(),
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
