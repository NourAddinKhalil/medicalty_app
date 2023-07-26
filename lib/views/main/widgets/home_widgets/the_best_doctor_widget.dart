import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/main/widgets/home_widgets/container_shade_widget.dart';

class TheBestDoctorWidget extends StatelessWidget {
  const TheBestDoctorWidget({
    super.key,
    required this.name,
    required this.spicialty,
    required this.image,
    required this.rate,
  });
  final String name;
  final String spicialty;
  final String image;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return ContainerShadeWidget(
      child: Column(
        children: [
          CircleSqureImage(
            pic: image,
            width: 170,
            height: 150,
            isCircle: false,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          const VerticalSizedBox(5),
          Text(
            name,
            style: FontSizes.h5?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalSizedBox(5),
          Text(
            spicialty,
            style: FontSizes.h9?.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xFF696969),
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
          const VerticalSizedBox(5),
        ],
      ),
    );
  }
}

class TheBestDoctorWithFavWidget extends StatelessWidget {
  const TheBestDoctorWithFavWidget({
    super.key,
    required this.name,
    required this.rating,
    required this.image,
    required this.spicialty,
    required this.viewCount,
    required this.isFavorite,
    required this.onFavoriteChange,
  });
  final String name;
  final double rating;
  final String image;
  final String spicialty;
  final int viewCount;
  final bool isFavorite;
  final void Function(bool isFav) onFavoriteChange;

  @override
  Widget build(BuildContext context) {
    return ContainerShadeWidget(
      child: Row(
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
          Column(),
          Column(),
        ],
      ),
    );
  }
}
