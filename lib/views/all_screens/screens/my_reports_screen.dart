// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicalty/gen/assets.gen.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/custom_sized_box.dart';
import '../../../utiles/my_text.dart';
import '../../patient/widget/linear_gradient_widget.dart';

class MyReportsScreen extends StatelessWidget {
  const MyReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorsConstant.blue,
            child: const Icon(Icons.add, color: ColorsConstant.white),
          ),
          backgroundColor: ColorsConstant.white,
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300.h,
                child: const LinearGradientContainer(
                  beginAlignment: Alignment.topRight,
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.chevron_left,
                                  color: ColorsConstant.black)),
                          MyText(
                            text: "My reports",
                            color: ColorsConstant.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox()
                        ],
                      ),
                      const VerticalSizedBox(60),
                      const MyReportsCardWidget(),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class MyReportsCardWidget extends StatelessWidget {
  const MyReportsCardWidget({
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
                      Image.asset(Assets.images.report.path),
                      MyText(
                        text: "F035-THHC",
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
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
