import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class ReviewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReviewsAppBar({
    super.key,
    required this.title,
    this.titleColor = ColorsConstant.black,
  });
  final String title;
  final Color titleColor;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Container(
            decoration: const BoxDecoration(
                color: ColorsConstant.dark, shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: ColorsConstant.white,
                  size: 25.sp,
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: MyText(
            text: title,
            color: titleColor,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold));
  }
}
