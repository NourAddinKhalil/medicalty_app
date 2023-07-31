import 'package:flutter/material.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleUponWidget extends StatelessWidget {
  const TitleUponWidget({
    super.key,
    required this.title,
    this.style,
    required this.child,
    this.paddingLeft = 3,
    this.paddingBottom = 4,
    this.titleWidth = double.infinity,
    this.align = TextAlign.start,
  });
  final String title;
  final TextStyle? style;
  final Widget child;
  final double paddingLeft;
  final double paddingBottom;
  final double titleWidth;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              CustomEdgeInsets.only(left: paddingLeft, bottom: paddingBottom),
          child: SizedBox(
            width: titleWidth.w,
            child: Text(
              title,
              style: style ??
                  FontSizes.h7?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              // TextStyle(
              //   // fontWeight: FontWeight.bold,
              //   fontSize: 28.sp,
              // ),
              textAlign: align,
            ),
          ),
        ),
        const VerticalSizedBox(7),
        child,
      ],
    );
  }
}
