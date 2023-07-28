import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/main/widgets/home_widgets/container_shade_widget.dart';

class SocialWorkerWidget extends StatelessWidget {
  const SocialWorkerWidget({
    super.key,
    required this.image,
    required this.name,
    required this.rate,
    required this.subtitle,
    required this.experience,
    required this.onTap,
  });
  final String image;
  final String name;
  final double rate;
  final String subtitle;
  final int experience;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ContainerShadeWidget(
        padding: CustomEdgeInsets.symmetric(10, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleSqureImage(
                  pic: image,
                  width: 70,
                  height: 70,
                ),
                const HorizantalSizedBox(25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: FontSizes.h6?.copyWith(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const HorizantalSizedBox(6),
                        Container(
                          padding: CustomEdgeInsets.symmetric(2, 12),
                          decoration: BoxDecoration(
                            color: ColorsConstant.primaryColor,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Text(
                              rate.toStringAsFixed(1),
                              style: FontSizes.h9?.copyWith(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSizedBox(4),
                    Text(
                      subtitle,
                      style: FontSizes.h9?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorsConstant.green1,
                      ),
                    ),
                    const VerticalSizedBox(8),
                    Text(
                      '$experience years experience',
                      style: FontSizes.h9?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorsConstant.green1,
                      ),
                    ),
                    const VerticalSizedBox(10),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
