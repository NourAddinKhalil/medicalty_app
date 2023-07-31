import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSizedBox extends StatelessWidget {
  const VerticalSizedBox(this.height, {Key? key, this.color}) : super(key: key);
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: ColoredBox(
        color: color ?? Colors.transparent,
      ),
    );
  }
}

class HorizantalSizedBox extends StatelessWidget {
  const HorizantalSizedBox(this.width, {Key? key}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w);
  }
}
