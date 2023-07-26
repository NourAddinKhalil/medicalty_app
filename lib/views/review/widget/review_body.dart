import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              MyText(
                text: "4.6",
                color: ColorsConstant.green3,
                fontSize: 50.sp,
              ),
              const Spacer(),
              Column(
                children: [
                  Row(
                    children: [
                      MyText(
                          text: "5",
                          color: ColorsConstant.green3,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal),
                      SizedBox(width: 5.w),
                      SizedBox(
                        width: 170.w,
                        child: const LinearProgressIndicator(
                          backgroundColor: ColorsConstant.blackGrey,
                          color: ColorsConstant.green3,
                          value: 0.6,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      MyText(
                          text: "4",
                          color: ColorsConstant.green3,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                      SizedBox(width: 5.w),
                      SizedBox(
                        width: 170.w,
                        child: const LinearProgressIndicator(
                          backgroundColor: ColorsConstant.blackGrey,
                          color: ColorsConstant.green3,
                          value: 0.7,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      MyText(
                          text: "3",
                          color: ColorsConstant.green3,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                      SizedBox(width: 5.w),
                      SizedBox(
                        width: 170.w,
                        child: const LinearProgressIndicator(
                          backgroundColor: ColorsConstant.blackGrey,
                          color: ColorsConstant.green3,
                          value: 0.3,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      MyText(
                          text: "2",
                          color: ColorsConstant.green3,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                      SizedBox(width: 5.sp),
                      SizedBox(
                        width: 170.w,
                        child: const LinearProgressIndicator(
                          backgroundColor: ColorsConstant.blackGrey,
                          color: ColorsConstant.green3,
                          value: 0.2,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      MyText(
                          text: "1",
                          color: ColorsConstant.green1,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                      SizedBox(width: 5.w),
                      SizedBox(
                        width: 170.w,
                        child: const LinearProgressIndicator(
                          backgroundColor: ColorsConstant.blackGrey,
                          color: ColorsConstant.green3,
                          value: 0.1,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 30.h),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 150.h,
                  margin: EdgeInsets.only(bottom: 16.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorsConstant.dark,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage("assets/images/person4.png"),
                            ),
                            SizedBox(width: 10.w),
                            MyText(
                              text: "Sharon Jem",
                              color: ColorsConstant.white,
                              fontSize: 15.sp,
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              width: 50.w,
                              decoration: BoxDecoration(
                                  color: ColorsConstant.green3,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: MyText(
                                      text: "4.6",
                                      color: ColorsConstant.black,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400)),
                            ),
                            const Spacer(),
                            MyText(
                                text: "2d ago",
                                color: ColorsConstant.white,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400)
                          ],
                        ),
                        SizedBox(height: 5.h),
                        MyText(
                            text:
                                "Had such an amazing session with Maria. She instantly picked up on the level of my fitness and adjusted the workout to suit me whilst also pushing me to my limits.",
                            color: ColorsConstant.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400)
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
