import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/app_background.dart';
import '../../../utiles/buttons_utiles/my_button.dart';
import '../../../utiles/my_text.dart';
import '../../review/widget/review_app_bar.dart';

class EditCardScreen extends StatelessWidget {
  const EditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      showImage: false,
      child: Scaffold(
        appBar: const ReviewsAppBar(title: "EDIT CARD"),
        // backgroundColor: Colors.transparent,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 20),
          child: MyButton(
              Circular: 40,
              color: ColorsConstant.blackBlue,
              widget: MyText(
                  text: "Save",
                  color: ColorsConstant.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
              function: () {}),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              height: 170.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(255, 219, 12, 238),
                        Color.fromARGB(243, 69, 50, 238),
                        Color.fromARGB(243, 184, 98, 241),
                      ])),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        MyText(
                            text: "VISA",
                            color: ColorsConstant.black,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                    MyText(
                        text: "MEGAN SUSAN",
                        color: ColorsConstant.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400),
                    MyText(
                        text: "5124 3256 6589 2048",
                        color: ColorsConstant.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            MyText(
                text: "Card Holder Name",
                color: ColorsConstant.black,
                fontSize: 11.sp,
                fontWeight: FontWeight.w600),
            MyText(
                text: "Mrgan Susan",
                color: ColorsConstant.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
            SizedBox(height: 10.h),
            Divider(
              thickness: 1.sp,
              color: ColorsConstant.blackGrey,
            ),
            SizedBox(height: 15.h),
            MyText(
                text: "Card Number",
                color: ColorsConstant.black,
                fontSize: 11.sp,
                fontWeight: FontWeight.w600),
            MyText(
                text: "5124 - 3256 - 6589 - 2048",
                color: ColorsConstant.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
            SizedBox(height: 10.h),
            Divider(
              thickness: 1.sp,
              color: ColorsConstant.blackGrey,
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        text: "Expiry (MM/YY)",
                        color: ColorsConstant.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600),
                    MyText(
                        text: "01 - 23",
                        color: ColorsConstant.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      width: 100.w,
                      child: Divider(
                        thickness: 1.sp,
                        color: ColorsConstant.blackGrey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        text: "CVC",
                        color: ColorsConstant.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600),
                    MyText(
                        text: "696",
                        color: ColorsConstant.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      width: 100.w,
                      child: Divider(
                        thickness: 1.sp,
                        color: ColorsConstant.blackGrey,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 30.h),
            Divider(
              thickness: 1.sp,
              color: ColorsConstant.blackGrey,
            ),
            SizedBox(height: 15.h),
            MyText(
                text: "Delete Card",
                color: ColorsConstant.red2,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
            SizedBox(height: 15.h),
            Divider(
              thickness: 1.sp,
              color: ColorsConstant.blackGrey,
            ),
          ]),
        ),
      ),
    );
  }
}
