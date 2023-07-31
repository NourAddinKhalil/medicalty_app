import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class BestDoctorTileWidget extends StatelessWidget {
  const BestDoctorTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 90.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: cardColor[index],
                      image: DecorationImage(
                          image: AssetImage(doctorPhoto[index]))),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Dr. jasmin noor",
                      color: ColorsConstant.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 20.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Icon(Icons.star,
                                size: 10.sp, color: ColorsConstant.yellow);
                          }),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/calories.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        MyText(
                          text: "110 kcal",
                          color: ColorsConstant.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                            width: 1.w,
                            height: 10.h,
                            color: ColorsConstant.black),
                        SizedBox(
                          width: 5.w,
                        ),
                        SvgPicture.asset("assets/images/clock.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        MyText(
                          text: "50 min",
                          color: ColorsConstant.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    MyText(
                      text: "Beginner",
                      color: ColorsConstant.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

List<String> doctorPhoto = [
  "assets/images/doctor2.png",
  "assets/images/doctor2.png",
  "assets/images/doctor2.png",
];

List<Color> cardColor = [
  ColorsConstant.irreugular,
  ColorsConstant.blue,
  ColorsConstant.pink,
];
