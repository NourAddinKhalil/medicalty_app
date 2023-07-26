import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../controllers/setting_controllers/switch_button_controller.dart';
import '../../../utiles/my_text.dart';
import '../../review/widget/review_app_bar.dart';

class NotificationsSettingsScreen extends StatelessWidget {
  final switchController = Get.put(SwitchController());
  NotificationsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorsConstant.dark,
          appBar: const ReviewsAppBar(
              title: "NOTIFICATIONS", titleColor: ColorsConstant.blackWhite),
          body: Column(children: [
            SizedBox(height: 20.h),
            ListTile(
              title: MyText(
                  text: "Workout Reminders",
                  color: ColorsConstant.blackWhite,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400),
              trailing: Obx(() {
                return SizedBox(
                  height: 20.h,
                  width: 40.w,
                  child: FlutterSwitch(
                    toggleSize: 15.sp,
                    inactiveColor: ColorsConstant.blackGrey,
                    activeColor: ColorsConstant.green3,
                    activeToggleColor: ColorsConstant.black,
                    value: switchController.isWorkoutSwitched.value,
                    onToggle: (bool value) {
                      switchController.isWorkoutSwitched.value = value;
                    },
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(thickness: 1.sp, color: ColorsConstant.blackGrey),
            ),
            ListTile(
              title: MyText(
                  text: "Program Notifications",
                  color: ColorsConstant.blackWhite,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400),
              trailing: Obx(() {
                return SizedBox(
                  height: 20.h,
                  width: 40.w,
                  child: FlutterSwitch(
                    toggleSize: 15.sp,
                    inactiveColor: ColorsConstant.blackGrey,
                    activeColor: ColorsConstant.green3,
                    activeToggleColor: ColorsConstant.black,
                    value: switchController.isProgramSwitched.value,
                    onToggle: (bool value) {
                      switchController.isProgramSwitched.value = value;
                    },
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(thickness: 1.sp, color: ColorsConstant.blackGrey),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                      text: "You can manage your app notification",
                      color: ColorsConstant.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    MyText(
                        text: "permission in your ",
                        color: ColorsConstant.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                    MyText(
                        text: "phone settings",
                        color: ColorsConstant.green3,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  ])
                ],
              ),
            )
          ])),
    );
  }
}
