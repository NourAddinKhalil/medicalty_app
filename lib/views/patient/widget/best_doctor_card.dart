import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class BestDoctorCard extends StatelessWidget {
  const BestDoctorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorsConstant.dark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/images/doctor2.png",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  MyText(
                      text: "Dr.Blessing",
                      color: ColorsConstant.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp),
                  MyText(
                      text: "Specalist Dentist",
                      color: ColorsConstant.green3,
                      fontSize: 14.sp),
                  SizedBox(
                    height: 20.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Icon(Icons.star,
                              size: 15.sp, color: ColorsConstant.yellow);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
