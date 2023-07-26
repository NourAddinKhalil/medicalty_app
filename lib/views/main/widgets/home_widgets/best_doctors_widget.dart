import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class BestDoctorsWidget extends StatelessWidget {
  const BestDoctorsWidget({
    super.key,
    required this.image,
    required this.name,
    required this.rate,
    required this.kcal,
    required this.min,
    required this.status,
  });
  final String image;
  final String name;
  final double rate;
  final int kcal;
  final int min;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleSqureImage(
          pic: image,
          width: 90,
          height: 90,
          isCircle: false,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        const HorizantalSizedBox(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: FontSizes.h8?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const VerticalSizedBox(5),
            RatingBarIndicator(
              itemCount: 5,
              rating: rate,
              unratedColor: Colors.grey,
              itemSize: 20.sp,
              itemPadding: CustomEdgeInsets.only(right: 1),
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
            ),
            const VerticalSizedBox(6),
            Row(
              children: [
                ImageHelpers.getSVGAssetImage(
                  15,
                  15,
                  pic: Assets.svgs.flame,
                ),
                Text(
                  ' $kcal kcl |  ',
                  style: FontSizes.h9?.copyWith(
                    // fontSize: 10.sp,
                    color: const Color(0xFF3A4750),
                  ),
                ),
                Icon(
                  Icons.access_time_outlined,
                  color: const Color(0xFF00ADB5),
                  size: 15.sp,
                ),
                Text(
                  ' $min min',
                  style: FontSizes.h9?.copyWith(
                    // fontSize: 10.sp,
                    color: const Color(0xFF3A4750),
                  ),
                ),
              ],
            ),
            const VerticalSizedBox(6),
            Text(
              status,
              style: FontSizes.h9?.copyWith(
                  // fontSize: 10.sp,
                  ),
            )
          ],
        ),
      ],
    );
  }
}
