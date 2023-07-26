import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/utiles/app_background.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/buttons_utiles/my_button.dart';
import '../../../utiles/my_text.dart';

class PaymentCompletedScreen extends StatelessWidget {
  final RxBool isChecked = false.obs;
  PaymentCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      showImage: false,
      child: Scaffold(
          // backgroundColor: Colors.transparent,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 20),
            child: MyButton(
                color: ColorsConstant.blackBlue,
                Circular: 40,
                widget: MyText(
                    text: "Done",
                    color: ColorsConstant.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700),
                function: () {}),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                        checkColor: ColorsConstant.blackBlue,
                        activeColor: ColorsConstant.green3,
                        value: isChecked.value,
                        onChanged: (newValue) => isChecked.value = newValue!,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    MyText(
                        text: "Payment Completed!",
                        color: ColorsConstant.black,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                SizedBox(height: 20.h),
                MyText(
                    text: "You’ve book a new appointment\nwith your trainer.",
                    color: ColorsConstant.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400),
                SizedBox(height: 40.h),
                Container(
                  width: double.infinity,
                  height: 220.h,
                  decoration: BoxDecoration(
                    color: ColorsConstant.dark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(children: [
                              MyText(
                                  text: "Trainer",
                                  color: ColorsConstant.blackWhite,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400),
                              CircleAvatar(
                                radius: 20.sp,
                                backgroundImage: const AssetImage(
                                    "assets/images/person4.png"),
                              ),
                            ]),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    MyText(
                                        text: "Emily Kevin",
                                        color: ColorsConstant.blackWhite,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Container(
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                          color: ColorsConstant.green3,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: MyText(
                                            color: ColorsConstant.black,
                                            text: "4.6",
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                MyText(
                                    text: "High Intensity Training",
                                    color: ColorsConstant.green3,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400)
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Divider(
                            thickness: 1.sp, color: ColorsConstant.blackWhite),
                        SizedBox(
                          height: 5.h,
                        ),
                        MyText(
                            text: "Date",
                            color: ColorsConstant.blackWhite,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400),
                        MyText(
                            text: "20 October 2021 - Wednesday",
                            color: ColorsConstant.blackWhite,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                        SizedBox(height: 15.h),
                        MyText(
                            text: "Time",
                            color: ColorsConstant.blackWhite,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400),
                        Row(
                          children: [
                            MyText(
                                text: "09:30 AM",
                                color: ColorsConstant.blackWhite,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                            const Spacer(),
                            const Icon(Icons.notifications,
                                color: ColorsConstant.blackWhite)
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
