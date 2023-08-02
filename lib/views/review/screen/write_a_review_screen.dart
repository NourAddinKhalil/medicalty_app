import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/app_background.dart';
import '../../../utiles/buttons_utiles/my_button.dart';
import '../../../utiles/form_utiles/my_text_form_field.dart';
import '../../../utiles/my_text.dart';
import '../widget/review_app_bar.dart';

class WriteReviewsScreen extends StatelessWidget {
  const WriteReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      showImage: false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const ReviewsAppBar(title: "WRITE A REVIEW"),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Row(
                children: [
                  MyText(
                      text: "4.6",
                      color: ColorsConstant.dark,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: ColorsConstant.dark),
                    width: 200.w,
                    height: 20.h,
                    child: const LinearProgressIndicator(
                      semanticsValue: "Rating",
                      semanticsLabel: "Rating",
                      backgroundColor: ColorsConstant.dark,
                      color: ColorsConstant.green3,
                      value: 0.6,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              MyTextFormField(
                validator: () {},
                hintText: "Review (Optional)",
                multiLines: true,
                fillColor: ColorsConstant.dark,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MyButton(
                  color: ColorsConstant.green3,
                  function: () {},
                  Circular: 40,
                  widget: MyText(
                      text: "Send",
                      color: ColorsConstant.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
