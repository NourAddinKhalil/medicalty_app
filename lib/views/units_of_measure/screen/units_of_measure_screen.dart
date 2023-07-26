// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/buttons_utiles/my_radio_button.dart';
import '../../review/widget/review_app_bar.dart';

class UnitsOfMeasureScreen extends StatelessWidget {
  UnitsOfMeasureScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorsConstant.dark,
          appBar: ReviewsAppBar(
              title: "UNITS OF MEASURE", titleColor: ColorsConstant.blackWhite),
          body: Column(
            children: [
              SizedBox(height: 20.h),
              MyRadioButton(title: "Metric", value: "metric"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child:
                    Divider(thickness: 1.sp, color: ColorsConstant.blackGrey),
              ),
              MyRadioButton(title: "Imperial", value: "imperial"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child:
                    Divider(thickness: 1.sp, color: ColorsConstant.blackGrey),
              ),
            ],
          )),
    );
  }
}
