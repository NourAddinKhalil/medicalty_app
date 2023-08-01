import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class MedicalCentersWidget extends StatelessWidget {
  final List<String> textOfCard;
  const MedicalCentersWidget({super.key, required this.textOfCard});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: textOfCard.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 50.h,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorsConstant.blackGrey),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: MyText(
                      text: textOfCard[index],
                      color: ColorsConstant.black,
                      fontSize: 17.sp),
                ),
              ),
            );
          }),
    );
  }
}
