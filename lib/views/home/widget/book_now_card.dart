import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class BookNowCard extends StatelessWidget {
  const BookNowCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 220.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorsConstant.irreugular),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Image.asset(
              "assets/images/doctor2.png",
              fit: BoxFit.cover,
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyText(
                    text: "Are you in any pain!\nFind our certified doctor!",
                    color: ColorsConstant.white,
                    fontSize: 17.sp,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorsConstant.blackBlue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: MyText(
                            text: "BOOK NOW",
                            color: ColorsConstant.white,
                            fontSize: 15.sp),
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/amb.png",
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
