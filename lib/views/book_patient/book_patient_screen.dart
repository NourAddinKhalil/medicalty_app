// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/themes/colors_constant.dart';
import '../../utiles/app_background.dart';
import '../../utiles/buttons_utiles/my_button.dart';
import '../../utiles/form_utiles/my_text_form_field.dart';
import '../../utiles/my_text.dart';
import '../patient/widget/doctor_info_card.dart';
import '../patient/widget/head_screen_widget.dart';
import '../patient/widget/linear_gradient_widget.dart';
import '../patient/widget/see_all_widget.dart';

class BookPatientScreen extends StatelessWidget {
  const BookPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int slotsAfternoonNumber = 7;
    List<TimeOfDay> splitTime = [];
    TimeOfDay startTime = const TimeOfDay(hour: 1, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 5, minute: 59);

    while (startTime.hour < endTime.hour) {
      splitTime.add(startTime);
      startTime = startTime.replacing(
          hour: startTime.hour + (startTime.minute + 30) ~/ 60,
          minute: (startTime.minute + 30) % 60);
    }

    splitTime.add(endTime);
    return AppBackground(
      showImage: false,
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: MyButton(
              color: ColorsConstant.blackBlue,
              widget: Center(
                  child: MyText(
                      text: "Book Now",
                      color: ColorsConstant.white,
                      fontSize: 18.sp)),
              function: () {}),
        ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeadScreen(),
                      SizedBox(height: 30.h),
                      MyTextFormField(
                        validator: () {},
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search),
                      ),
                      SizedBox(height: 15.h),
                      Divider(
                        thickness: 1.sp,
                        color: ColorsConstant.black,
                      ),
                      SizedBox(height: 20.h),
                      SeeAllWidget(
                          seeAllFunction: () {}, whatToSeeAll: "Select Time"),
                      SizedBox(height: 10.h),
                      const DoctorInfoCard(),
                      SizedBox(height: 20.h),

                      //TODO

                      SizedBox(height: 20.h),
                      MyText(
                          text: "Afternoon $slotsAfternoonNumber slots",
                          color: ColorsConstant.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp),
                      SizedBox(height: 20.h),

                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: slotsAfternoonNumber,
                            itemBuilder: (context, index) {
                              return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorsConstant.blackBlue),
                                  height: 60,
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.only(right: 8.0),
                                  child: Center(
                                    child: MyText(
                                        text:
                                            '${splitTime[index].format(context)}',
                                        color: ColorsConstant.white,
                                        fontSize: 15.sp),
                                  ));
                            }),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
