import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SqureBtnWithBorder extends StatelessWidget {
  const SqureBtnWithBorder({
    super.key,
    this.child,
    this.borderColor = ColorsConstant.green1,
    this.onTap,
    this.width = 100,
    this.height = 100,
    this.borderWidth = 2,
  });
  final Color borderColor;
  final Function()? onTap;
  final Widget? child;
  final double width;
  final double height;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: child,
      ),
    );
  }
}
