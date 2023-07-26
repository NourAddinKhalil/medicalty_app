// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/app/routes.dart';
import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';
import '../../review/widget/review_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.dark,
        appBar: const ReviewsAppBar(
            title: "SETTINGS", titleColor: ColorsConstant.blackWhite),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.w),
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                        onTap: () {
                          Get.toNamed(screensRoutes[index]);
                        },
                        trailing: const Icon(Icons.chevron_right,
                            color: ColorsConstant.blackWhite),
                        title: MyText(
                            text: screensNames[index],
                            color: ColorsConstant.blackWhite,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                      child: Divider(
                        color: ColorsConstant.blackGrey,
                        thickness: 1.sp,
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }

  List<String> screensNames = [
    "Units of Measure",
    "Notifications",
    "Language",
    "Contact Us"
  ];
  List<String> screensRoutes = [
    Routes.unitsOfMeasureScreen,
    Routes.notificationsSettingsScreen,
    Routes.languageScreen,
    Routes.contactUsScreen
  ];
}
