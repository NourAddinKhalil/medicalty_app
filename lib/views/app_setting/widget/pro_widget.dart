import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class ProWidget extends StatelessWidget {
  const ProWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Container(
        width: double.infinity,
        height: 90.h,
        decoration: BoxDecoration(
            color: ColorsConstant.dark,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50.w,
                  decoration: BoxDecoration(
                      color: ColorsConstant.red2,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: MyText(
                        text: "Pro",
                        color: ColorsConstant.blackWhite,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                MyText(
                    text: "Upgrade to Premium",
                    color: ColorsConstant.blackWhite,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600),
                MyText(
                    text: "This subscription is auto-renewable",
                    color: ColorsConstant.blackWhite,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right,
              color: ColorsConstant.blackWhite,
              size: 30.sp,
            )
          ]),
        ),
      ),
    );
  }
}
