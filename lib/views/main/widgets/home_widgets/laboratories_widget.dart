import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_elevated_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/main/widgets/home_widgets/container_shade_widget.dart';

class LaboratoriesWidget extends StatelessWidget {
  const LaboratoriesWidget({
    super.key,
    required this.name,
    required this.image,
    required this.emial,
    required this.phone,
    required this.address,
    required this.country,
    required this.workNumber,
    required this.onButtonPressed,
  });
  final String name;
  final String image;
  final String emial;
  final String phone;
  final String address;
  final String country;
  final String workNumber;
  final void Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ContainerShadeWidget(
      padding: CustomEdgeInsets.symmetric(4, 8),
      child: Row(
        children: [
          Column(
            children: [
              CircleSqureImage(
                pic: image,
                width: 100,
                height: 100,
                isCircle: false,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              const VerticalSizedBox(6),
              Text(
                country.toUpperCase(),
                style: FontSizes.h7?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorsConstant.green1,
                ),
              ),
              const VerticalSizedBox(3),
              Text(
                workNumber,
                style: FontSizes.h9?.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const HorizantalSizedBox(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const VerticalSizedBox(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          name,
                          style: FontSizes.h6?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const VerticalSizedBox(6),
                      Text(
                        emial,
                        style: FontSizes.h9?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        phone,
                        style: FontSizes.h9?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        address,
                        style: FontSizes.h9?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const VerticalSizedBox(10),
              CustomElevatedButton(
                title: 'Chooes Now'.toUpperCase(),
                onPressed: onButtonPressed,
                style: ElevatedButton.styleFrom(
                  padding: CustomEdgeInsets.symmetric(15, 15),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  textStyle: FontSizes.h8?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const VerticalSizedBox(5),
            ],
          ),
        ],
      ),
    );
  }
}
