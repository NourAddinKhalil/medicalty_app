import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/main/widgets/home_widgets/container_shade_widget.dart';

class DepartmentsWidget extends StatelessWidget {
  const DepartmentsWidget({
    super.key,
    required this.sectionName,
    required this.doctorName,
    required this.experience,
    required this.rate,
    required this.image,
  });
  final String image;
  final String sectionName;
  final String doctorName;
  final int experience;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return ContainerShadeWidget(
      padding: CustomEdgeInsets.symmetric(8, 4),
      child: Row(
        children: [
          CircleSqureImage(
            pic: image,
            width: 100,
            height: 100,
            isCircle: false,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          const HorizantalSizedBox(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sectionName,
                style: FontSizes.h7?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                doctorName,
                style: FontSizes.h7?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '$experience Years of Experience',
                style: FontSizes.h7?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VerticalSizedBox(5),
              RatingBarIndicator(
                itemCount: 5,
                rating: rate,
                unratedColor: Colors.grey,
                itemSize: 24.sp,
                itemPadding: CustomEdgeInsets.only(right: 1),
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
