// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import '../../../constants/themes/colors_constant.dart';

import '../../../controllers/setting_controllers/switch_button_controller.dart';
import '../../../utiles/app_background.dart';
import '../../../utiles/buttons_utiles/my_button.dart';
import '../../../utiles/my_text.dart';
import '../widget/pro_widget.dart';

final switchController = Get.put(SwitchController());

class AppSettingsScreen extends StatelessWidget {
  AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      showImage: false,
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorsConstant.white,
          title: MyText(
            text: "APP SETTINGS",
            color: ColorsConstant.black,
            fontSize: 25.sp,
            fontWeight: FontWeight.w700,
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left,
              color: ColorsConstant.black,
              size: 30.sp,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.w),
          child: Column(children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: settingText.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                          onTap: () {
                            //  screensRoutes;
                          },
                          leading: SvgPicture.asset(leadingIcon[index]),
                          trailing: trailingWidget[index],
                          title: MyText(
                              text: settingText[index],
                              color: ColorsConstant.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600)),
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
            SizedBox(
              height: 100.h,
            ),
            const ProWidget(),
            const Spacer(),
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
                  child: MyButton(
                      color: ColorsConstant.blackBlue,
                      widget: MyText(
                          text: "UPGRADE PREMIUME",
                          color: ColorsConstant.white,
                          fontSize: 18.sp),
                      function: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: MyText(
                        text: "version 1.0.0",
                        color: ColorsConstant.blackBlue,
                        fontSize: 15.sp),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  List<Widget> trailingWidget = [
    const Icon(Icons.chevron_right, color: ColorsConstant.black),
    const Icon(Icons.chevron_right, color: ColorsConstant.black),
    Obx(() {
      return SizedBox(
        height: 20.h,
        width: 40.w,
        child: FlutterSwitch(
          toggleSize: 15.sp,
          inactiveColor: ColorsConstant.blackGrey,
          activeColor: ColorsConstant.green3,
          activeToggleColor: ColorsConstant.black,
          value: switchController.isAppleHlthSwitched.value,
          onToggle: (bool value) {
            switchController.isAppleHlthSwitched.value = value;
          },
        ),
      );
    }),
    Obx(() {
      return SizedBox(
        height: 20.h,
        width: 40.w,
        child: FlutterSwitch(
          toggleSize: 15.sp,
          inactiveColor: ColorsConstant.blackGrey,
          activeColor: ColorsConstant.green3,
          activeToggleColor: ColorsConstant.black,
          value: switchController.isDarkModeSwitched.value,
          onToggle: (bool value) {
            switchController.isDarkModeSwitched.value = value;
          },
        ),
      );
    }),
    MyText(
        text: "Engilsh",
        color: ColorsConstant.blackBlue,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600)
  ];
}

List<String> settingText = [
  "Reminder",
  "Change Password",
  "Apple Health",
  "Dark Mode",
  "Language",
];
List<Function> screensRoutes = [
  () {},
  () {},
  () {},
  () {},
  () {},
];

List<String> leadingIcon = [
  "assets/images/bell-icon.svg",
  "assets/images/lock.svg",
  "assets/images/heart-icon.svg",
  "assets/images/sleep-icon.svg",
  "assets/images/language-icon.svg",
];
