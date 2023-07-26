import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';

class MealPlansWidget extends StatelessWidget {
  const MealPlansWidget({
    Key? key,
    required this.title,
    required this.fromPrice,
    required this.toPrice,
    required this.image,
  }) : super(key: key);
  final String title;
  final double fromPrice;
  final double toPrice;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleSqureImage(
          pic: image,
          width: double.infinity,
          height: 180,
          isCircle: false,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        Text(
          title,
          style: FontSizes.h9?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const VerticalSizedBox(6),
        Row(
          children: [
            Text(
              '${fromPrice.toStringAsFixed(2)}\$ - ${toPrice.toStringAsFixed(2)}\$',
              style: FontSizes.h9?.copyWith(
                fontSize: 10.sp,
                color: const Color(0xFF3A4750),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
