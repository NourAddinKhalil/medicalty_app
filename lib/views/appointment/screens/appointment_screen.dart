// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/custom_sized_box.dart';
import '../../../utiles/my_text.dart';
import '../../review/widget/review_app_bar.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.white,
        appBar: const ReviewsAppBar(title: "WRITE A REVIEW"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorsConstant.dark),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30.sp,
                          backgroundColor: Colors.white,
                          backgroundImage: const AssetImage(
                            "assets/images/doctor.png",
                          ),
                        ),
                        const HorizantalSizedBox(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                MyText(
                                    text: "Richard Will",
                                    color: ColorsConstant.white,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.normal),
                                const HorizantalSizedBox(15),
                                Container(
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      color: ColorsConstant.green3,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: MyText(
                                        color: ColorsConstant.dark,
                                        text: "4.6",
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            MyText(
                                text: "High Intensity Training",
                                color: ColorsConstant.green2,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.normal),
                            MyText(
                                text: "5 years experience",
                                color: ColorsConstant.green2,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.normal)
                          ],
                        ),
                        const SizedBox()
                      ],
                    ),
                  ),
                ),
                const VerticalSizedBox(30),
                Container(
                  decoration: BoxDecoration(
                      color: ColorsConstant.dark.withOpacity(.9),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SfDateRangePicker(
                          rangeTextStyle:
                              const TextStyle(color: ColorsConstant.white),
                          rangeSelectionColor: ColorsConstant.green3,
                          selectionColor: ColorsConstant.green3,
                          todayHighlightColor: ColorsConstant.green3,
                          selectionTextStyle:
                              const TextStyle(color: ColorsConstant.red),
                          showTodayButton: true,
                          //  onSelectionChanged: _onSelectionChanged,
                          selectionMode: DateRangePickerSelectionMode.range,
                          initialSelectedRange: PickerDateRange(
                              DateTime.now().subtract(const Duration(days: 4)),
                              DateTime.now().add(const Duration(days: 3)))),
                      const VerticalSizedBox(10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          color: ColorsConstant.white,
                        ),
                      ),
                      const VerticalSizedBox(10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
                        child: MyText(
                          text: "Time",
                          color: ColorsConstant.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const VerticalSizedBox(5),
                      Padding(
                        padding: EdgeInsets.all(20.0.sp),
                        child: SizedBox(
                          height: 60,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: slotsAfternoonNumber,
                              itemBuilder: (context, index) {
                                return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorsConstant.dark),
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
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
