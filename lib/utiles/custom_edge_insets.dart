import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEdgeInsets {
  static EdgeInsets all(double value) {
    return symmetric(value, value);
  }

  static EdgeInsets symmetric(double vertical, double horizontal) {
    return EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w);
  }

  static EdgeInsets horizontal(double horizontal) {
    return EdgeInsets.symmetric(horizontal: horizontal.w);
  }

  static EdgeInsets vertical(double vertical) {
    return EdgeInsets.symmetric(vertical: vertical.w);
  }

  static EdgeInsets only({
    double top = 0.0,
    double bottom = 0.0,
    double right = 0.0,
    double left = 0.0,
  }) {
    return EdgeInsets.only(
      top: top.h,
      bottom: bottom.h,
      right: right.w,
      left: left.w,
    );
  }
}
