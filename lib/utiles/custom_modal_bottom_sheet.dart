import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/theme_controller.dart';

class CustomModalBottomSheet {
  // static Widget _makeDissmisable({
  //   required Widget child,
  //   // required BuildContext context,
  // }) {
  //   return GestureDetector(
  //     behavior: HitTestBehavior.opaque,
  //     onTap: () {
  //       // Navigator.of(context).pop();
  //       Get.back();
  //     },
  //     child: GestureDetector(
  //       onTap: () {},
  //       child: child,
  //     ),
  //   );
  // }

  static Widget buildHandle() {
    return GetBuilder<ThemeController>(
      builder: (prov) {
        return Center(
          child: Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: prov.isDarkMode
                  ? const Color.fromARGB(255, 94, 94, 94)
                  : const Color.fromARGB(255, 226, 226, 226),
              borderRadius: BorderRadius.circular(99),
            ),
          ),
        );
      },
    );
  }

  static void _showCustomModalSheet(
    // BuildContext context,
    Widget child, {
    required bool isScrollControlled,
  }) {
    Get.bottomSheet(
      backgroundColor: ColorsConstant.white,
      buildStack(child),
    );

    // showModalBottomSheet(
    //   // context: context,
    //   backgroundColor: Colors.transparent,
    //   isScrollControlled: isScrollControlled,
    //   elevation: 0.1,
    //   builder: (ctx) {
    //     return _makeDissmisable(
    //       // context: context,
    //       child: child,
    //     );
    //   },
    // );
  }

  static void buildCustomModalSheet(
    // BuildContext context,
    Widget child, {
    // double minChildSize = 0.4,
    // double maxChildSize = 0.9,
    bool showTopIcon = true,
    bool isScrollControlled = true,
  }) {
    _showCustomModalSheet(
      // context,
      isScrollControlled: isScrollControlled,
      Container(
        padding: CustomEdgeInsets.symmetric(4, 8),
        decoration: BoxDecoration(
          color: ColorsConstant.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: child,
      ),
    );
  }

  static Widget buildStack(Widget child, {bool showTopIcon = true}) {
    return Stack(
      children: [
        child,
        if (showTopIcon)
          Positioned(
            top: 5.h,
            right: 0,
            left: 0,
            child: buildHandle(),
            // Icon(
            //   Icons.more_horiz_outlined,
            //   size: 110.0.sp,
            //   color: Colors.grey,
            // ),
          ),
      ],
    );
  }
}
