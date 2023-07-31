import 'package:flutter/material.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key? key,
    this.showSemanticLabal = true,
    this.noBackColor = true,
  }) : super(key: key);
  final bool showSemanticLabal;
  final bool noBackColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 100.h,
        width: 150.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: noBackColor
              ? Colors.white
              : Get.theme.primaryColor, //.withOpacity(0.1),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                semanticsLabel: showSemanticLabal ? "Loading ..." : "",
                color: noBackColor ? Get.theme.primaryColor : Colors.white,
              ),
              const VerticalSizedBox(5),
              Text(
                showSemanticLabal ? "Loading ..." : "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
