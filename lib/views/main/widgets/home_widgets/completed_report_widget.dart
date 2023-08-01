import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';
import 'package:medicalty/views/main/widgets/home_widgets/container_shade_widget.dart';

class CompletedReportWidget extends StatelessWidget {
  const CompletedReportWidget({
    super.key,
    required this.image,
    required this.doctorName,
    required this.patientName,
    this.rate,
    this.money,
    required this.name,
  });
  final String image;
  final String name;
  final String doctorName;
  final String patientName;
  final double? rate;
  final double? money;

  Widget _buildItem({required String icon, required Widget child}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageHelpers.getAssetImage(
          25,
          25,
          pic: icon,
        ),
        const HorizantalSizedBox(10),
        child,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContainerShadeWidget(
      padding: CustomEdgeInsets.symmetric(6, 16),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleSqureImage(
            pic: image,
            width: 130,
            height: 130,
            isCircle: false,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          const VerticalSizedBox(5),
          Text(
            name,
            style: FontSizes.h6?.copyWith(
              fontSize: 19.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const VerticalSizedBox(10),
          _buildItem(
            icon: Assets.images.docHat.path,
            child: Text(
              doctorName,
              style: FontSizes.h6?.copyWith(
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const VerticalSizedBox(5),
          _buildItem(
            icon: Assets.images.patientLay.path,
            child: Text(
              patientName,
              style: FontSizes.h7?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const VerticalSizedBox(5),
          if (rate != null)
            RatingBarIndicator(
              itemCount: 5,
              rating: rate!,
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
          if (money != null)
            Text(
              '${money!.toStringAsFixed(2)}\$',
              style: FontSizes.h7?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorsConstant.green1,
              ),
            )
        ],
      ),
    );
  }
}
