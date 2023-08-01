import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class PaidAdsWidget extends StatelessWidget {
  const PaidAdsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: ListView.builder(
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 170.h,
              width: 120.w,
              child: Card(
                shadowColor: ColorsConstant.dark,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.favorite_border,
                              size: 15.sp, color: ColorsConstant.black),
                          const Spacer(),
                          MyText(
                              text: "3.6",
                              color: ColorsConstant.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp)
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage:
                            const AssetImage("assets/images/person4.png"),
                        radius: 23.sp,
                      ),
                      MyText(
                          text: "Dr.Crick",
                          color: ColorsConstant.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp),
                      MyText(
                          text: "Specalist Dentist",
                          color: ColorsConstant.green3,
                          fontSize: 12.sp),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
