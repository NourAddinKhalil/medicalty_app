import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/custom_sized_box.dart';
import '../../../utiles/my_text.dart';
import '../../home/widget/best_doctor_tile_widget.dart';

class MyBookingCardWidget extends StatelessWidget {
  const MyBookingCardWidget({
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
            padding: EdgeInsets.only(bottom: 10.0.h),
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
                const HorizantalSizedBox(10),
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
                                size: 15.sp, color: ColorsConstant.yellow);
                          }),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/clock.svg"),
                        const HorizantalSizedBox(2),
                        MyText(
                          text: "11:00 PM",
                          color: ColorsConstant.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        const HorizantalSizedBox(5),
                        Container(
                            width: 1.w,
                            height: 10.h,
                            color: ColorsConstant.black),
                        const HorizantalSizedBox(5),
                        SvgPicture.asset("assets/images/clock.svg"),
                        const HorizantalSizedBox(2),
                        MyText(
                          text: "11:30 PM",
                          color: ColorsConstant.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    MyText(
                      text: "12/12/2023",
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
