// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../gen/assets.gen.dart';
import '../../../utiles/custom_sized_box.dart';
import '../../../utiles/my_text.dart';

class MyBillsCardWidget extends StatelessWidget {
  const MyBillsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 10.0.w),
              child: Card(
                child: Container(
                  height: 270.h,
                  width: 185.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(Assets.images.bill.path),
                      MyText(
                        text: "invoice name",
                        color: ColorsConstant.black,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/profile.svg",
                              color: ColorsConstant.black),
                          const HorizantalSizedBox(5),
                          MyText(
                            text: "Dr.Blessing",
                            color: ColorsConstant.black,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/profile.svg",
                              color: ColorsConstant.black),
                          const HorizantalSizedBox(5),
                          MyText(
                            text: "Ali mohammed",
                            color: ColorsConstant.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      MyText(
                        text: "155\$",
                        color: ColorsConstant.green2,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
