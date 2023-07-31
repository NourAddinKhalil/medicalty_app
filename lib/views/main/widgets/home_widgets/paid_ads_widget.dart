import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/main/widgets/home_widgets/container_shade_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/favorite_btn.dart';

class PaidAdsWidget extends StatelessWidget {
  const PaidAdsWidget({
    super.key,
    required this.name,
    required this.hourlyPaid,
    required this.rating,
    required this.image,
    required this.isFavorite,
    required this.onFavoriteChange,
  });
  final String name;
  final double hourlyPaid;
  final double rating;
  final String image;
  final bool isFavorite;
  final void Function(bool isFav) onFavoriteChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      child: ContainerShadeWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FavoriteBtn(
                  isFavorite: isFavorite,
                  onFavoriteChange: onFavoriteChange,
                ),
                Text(
                  '${rating.toStringAsFixed(1)}  ',
                  style: FontSizes.h9?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            CircleSqureImage(
              pic: image,
              width: 70,
              height: 70,
            ),
            const VerticalSizedBox(5),
            Text(
              name,
              style: FontSizes.h9?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const VerticalSizedBox(4),
            RichText(
              text: TextSpan(
                text: '\$',
                style: FontSizes.h9?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: ColorsConstant.green1,
                ),
                children: [
                  TextSpan(
                    text: '${hourlyPaid.toStringAsFixed(2)}/hour',
                    style: FontSizes.h9?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
