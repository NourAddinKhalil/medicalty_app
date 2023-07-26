import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';
class SocialWorkerCard extends StatelessWidget {
  const SocialWorkerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shadowColor: ColorsConstant.dark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 30.sp,
              backgroundImage: const AssetImage("assets/images/person4.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    MyText(
                        text: "Richard Will",
                        color: ColorsConstant.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.normal),
                     SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      width: 30.w,
                      decoration: BoxDecoration(
                          color: ColorsConstant.blackBlue,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: MyText(
                            color: ColorsConstant.white,
                            text: "4.6",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                MyText(
                    text: "High Intensity Training",
                    color: ColorsConstant.green3,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.normal),
                MyText(
                    text: "5 years experience",
                    color: ColorsConstant.green3,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.normal)
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: ColorsConstant.black,
            )
          ],
        ),
      ),
    );
  }
}
