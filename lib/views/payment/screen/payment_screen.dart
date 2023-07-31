import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/utiles/app_background.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/buttons_utiles/my_button.dart';
import '../../../utiles/my_text.dart';
import '../../review/widget/review_app_bar.dart';
import '../widget/visa_card_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      showImage: false,
      child: Scaffold(
        appBar: const ReviewsAppBar(title: "PAYMENT"),
        backgroundColor: ColorsConstant.white,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 20),
          child: MyButton(
              Circular: 40,
              color: ColorsConstant.blackBlue,
              widget: MyText(
                  text: "Confirm",
                  color: ColorsConstant.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
              function: () {}),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MyText(
                text: "Payment Method",
                color: ColorsConstant.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              height: 115.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Container(
                    width: 60.w,
                    height: 115.h,
                    decoration: BoxDecoration(
                        color: ColorsConstant.dark,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Icon(Icons.add, color: ColorsConstant.white),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const VisaCard();
                      }),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MyText(
                text: "Order Details",
                color: ColorsConstant.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 1.sp,
              color: ColorsConstant.blackGrey,
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Column(children: [
                  MyText(
                      text: "Trainer",
                      color: ColorsConstant.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/person4.png"),
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
                            color: ColorsConstant.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: ColorsConstant.green3,
                              borderRadius: BorderRadius.circular(5)),
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
                        color: ColorsConstant.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400)
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 1.sp,
              color: ColorsConstant.blackGrey,
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MyText(
                text: "Date",
                color: ColorsConstant.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MyText(
                text: "20 October 2021 - Wednesday",
                color: ColorsConstant.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MyText(
                text: "Time",
                color: ColorsConstant.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MyText(
                text: "09:30 AM",
                color: ColorsConstant.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 1.sp,
              color: ColorsConstant.blackGrey,
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                MyText(
                    text: "Estimated Cost",
                    color: ColorsConstant.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400),
                const Spacer(),
                MyText(
                    text: "175.99 \$",
                    color: ColorsConstant.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 1.sp,
              color: ColorsConstant.blackGrey,
            ),
          ),
        ]),
      ),
    );
  }
}
