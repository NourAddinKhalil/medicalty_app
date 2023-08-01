import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_elevated_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/main/widgets/home_widgets/container_shade_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/favorite_btn.dart';

class BookDoctorWidget extends StatelessWidget {
  const BookDoctorWidget({
    super.key,
    required this.name,
    required this.nextAvailable,
    required this.numberOfPatient,
    required this.percent,
    required this.expierence,
    required this.image,
    required this.spicialty,
    required this.isFavorite,
    required this.onFavoriteChange,
    required this.onBookPressed,
  });
  final String name;
  final int expierence;
  final int percent;
  final double numberOfPatient;
  final String image;
  final String spicialty;
  final String nextAvailable;
  final bool isFavorite;
  final void Function(bool isFav) onFavoriteChange;
  final void Function() onBookPressed;

  @override
  Widget build(BuildContext context) {
    return ContainerShadeWidget(
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
                'Next Available',
                style: FontSizes.h9,
              ),
              const VerticalSizedBox(3),
              Text(
                nextAvailable,
                style: FontSizes.h9?.copyWith(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w400,
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
                      Text(
                        name,
                        style: FontSizes.h6?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const VerticalSizedBox(6),
                      Text(
                        spicialty,
                        style: FontSizes.h9?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFC4C4C4),
                        ),
                      ),
                      Text(
                        '$expierence Years Experience',
                        style: FontSizes.h9?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFC4C4C4),
                        ),
                      ),
                      Text(
                        '${percent.toString()}%    $numberOfPatient Patient Booking',
                        style: FontSizes.h9?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFC4C4C4),
                        ),
                      ),
                    ],
                  ),
                  const HorizantalSizedBox(10),
                  FavoriteBtn(
                    isFavorite: isFavorite,
                    onFavoriteChange: onFavoriteChange,
                  ),
                ],
              ),
              const VerticalSizedBox(10),
              CustomElevatedButton(
                title: 'Book Now',
                onPressed: onBookPressed,
                style: ElevatedButton.styleFrom(
                  padding: CustomEdgeInsets.symmetric(15, 15),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  textStyle: FontSizes.h6?.copyWith(
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
