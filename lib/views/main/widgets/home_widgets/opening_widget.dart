import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_elevated_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';

class OpeningWidget extends StatelessWidget {
  const OpeningWidget({
    super.key,
    required this.title,
    required this.onButtonPressed,
    required this.buttonTitle,
  });
  final String title;
  final void Function() onButtonPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSizedBox(20),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                gradient: ColorsConstant.orangeGradient2,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            Positioned(
              top: -90.h,
              left: -40.w,
              child: CircleSqureImage(
                pic: Assets.images.doctor2.path,
                width: 240,
                height: 350,
                isCircle: false,
                decoration: const BoxDecoration(),
              ),
            ),
            Positioned(
              top: 50.h,
              left: 160.w,
              child: SizedBox(
                width: 200.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      softWrap: true,
                      style: FontSizes.h8?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const VerticalSizedBox(20),
                    Padding(
                      padding: CustomEdgeInsets.only(left: 16.0),
                      child: CustomElevatedButton(
                        title: buttonTitle.toUpperCase(),
                        style: ElevatedButton.styleFrom(
                          padding: CustomEdgeInsets.symmetric(8, 12),
                          textStyle: FontSizes.h8?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: onButtonPressed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -40.h,
              right: 85.w,
              child: CircleSqureImage(
                pic: Assets.images.docHead.path,
                width: 80,
                height: 80,
                decoration: const BoxDecoration(),
                isCircle: false,
              ),
            )
          ],
        ),
        const VerticalSizedBox(20),
      ],
    );
  }
}
