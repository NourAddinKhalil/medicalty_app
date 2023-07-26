import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/main/widgets/home_widgets/favorite_btn.dart';

class TherapyWidget extends StatelessWidget {
  const TherapyWidget({
    super.key,
    required this.title,
    required this.sessionDuration,
    required this.image,
    required this.isFavorite,
    required this.onFavoriteChange,
  });
  final String title;
  final int sessionDuration;
  final String image;
  final bool isFavorite;
  final void Function(bool isFav) onFavoriteChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSizedBox(10),
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
              'session duration | ',
              style: FontSizes.h9?.copyWith(
                fontSize: 10.sp,
                color: const Color(0xFF3A4750),
              ),
            ),
            const HorizantalSizedBox(4),
            Icon(
              Icons.access_time,
              color: const Color(0xFF00ADB5),
              size: 20.sp,
            ),
            const HorizantalSizedBox(4),
            Text(
              '$sessionDuration min',
              style: FontSizes.h9?.copyWith(
                fontSize: 10.sp,
                color: const Color(0xFF3A4750),
              ),
            ),
          ],
        ),
        const VerticalSizedBox(10),
        Stack(
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
            Positioned(
              right: 40.w,
              top: 40.h,
              child: SizedBox(
                width: 26.w,
                height: 26.h,
                child: Center(
                  child: FavoriteBtn(
                    isFavorite: isFavorite,
                    onFavoriteChange: onFavoriteChange,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
