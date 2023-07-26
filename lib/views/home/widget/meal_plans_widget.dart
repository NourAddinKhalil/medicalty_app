import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class MealPlansWidget extends StatelessWidget {
  const MealPlansWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 150.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage("assets/images/patient1.png"),
                  fit: BoxFit.cover)),
        ),
        SizedBox(height: 10.h),
        MyText(
          text: "Gastric bypass surgery",
          color: ColorsConstant.black,
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 5.h),
        MyText(
          text: "1300\$ - 2000\$",
          color: ColorsConstant.blackGrey,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 10.h),
        Divider(
          thickness: 1.sp,
          color: ColorsConstant.black,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
