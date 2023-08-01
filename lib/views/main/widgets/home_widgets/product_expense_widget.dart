import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/convert_to_date_time.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/main/widgets/home_widgets/container_shade_widget.dart';

class ProductExpenseWidget extends StatelessWidget {
  const ProductExpenseWidget({
    super.key,
    required this.name,
    this.desc,
    this.date,
    this.money,
    required this.image,
  });
  final String name;
  final String image;
  final String? desc;
  final DateTime? date;
  final double? money;

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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          const VerticalSizedBox(10),
          Text(
            name,
            style: FontSizes.h7?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const VerticalSizedBox(10),
          SizedBox(
            width: 140.w,
            child: Text(
              desc ?? DateTimeHelpers.convertDateToString(date!),
              textAlign: TextAlign.center,
              maxLines: 2,
              style: FontSizes.h7?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const VerticalSizedBox(10),
          if (money != null)
            Text(
              '${money!.toStringAsFixed(2)}\$',
              style: FontSizes.h7?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorsConstant.red,
              ),
            )
        ],
      ),
    );
  }
}
