import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class SessionInfoWidget extends StatelessWidget {
  const SessionInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
                text: sessionType[index],
                color: ColorsConstant.black,
                fontSize: 13.sp),
            Row(
              children: [
                MyText(
                    text: "session duration",
                    color: ColorsConstant.black,
                    fontSize: 13.sp),
                SizedBox(width: 5.w),
                Container(
                    width: 1.w, height: 10.h, color: ColorsConstant.black),
                SizedBox(width: 5.w),
                SvgPicture.asset("assets/images/clock.svg"),
                SizedBox(width: 5.w),
                MyText(
                    text: "30 min",
                    color: ColorsConstant.black,
                    fontSize: 13.sp),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
                width: double.infinity,
                height: 150.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(patientPhoto[index]),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: ColorsConstant.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.favorite, color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 10.h),
            Divider(
              thickness: 1.sp,
              color: ColorsConstant.black,
            ),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }
}

List<String> sessionType = [
  "Physiotherapy session for the elderly",
  "Wound changing and sterilization session",
];

List<String> patientPhoto = [
  "assets/images/patient1.png",
  "assets/images/patient2.png",
];
