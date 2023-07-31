import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static bool isMobile() {
    return Get.mediaQuery.size.width < 576;
  }

  static bool isTablet() {
    return Get.mediaQuery.size.width >= 576 && Get.mediaQuery.size.width <= 992;
  }

  static bool isDesktop() {
    return Get.mediaQuery.size.width > 992;
  }

  @override
  Widget build(BuildContext context) {
    final size = Get.mediaQuery.size;
    if (size.width > 992) {
      return desktop;
    } else if (size.width >= 576 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
