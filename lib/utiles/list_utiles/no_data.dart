import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
    required this.imagePath,
    required this.title,
    this.subTitle = '',
  });
  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            padding: CustomEdgeInsets.all(30),
            decoration: BoxDecoration(
              color: const Color(0XFFF2F2F2),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: ImageHelpers.getSVGAssetImage(
              40,
              40,
              pic: imagePath,
            ),
          ),
          const VerticalSizedBox(6),
          Text(
            title,
            style: FontSizes.h7?.copyWith(
              color: const Color(0xFF919191),
            ),
          ),
          const VerticalSizedBox(6),
          Text(
            subTitle,
            style: FontSizes.h9?.copyWith(
              color: const Color(0xFF919191),
            ),
          ),
        ],
      ),
    );
  }
}
