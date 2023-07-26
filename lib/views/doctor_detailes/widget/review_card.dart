import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 150.h,
        width: MediaQuery.of(context).size.width - 60,
        decoration: BoxDecoration(
            color: ColorsConstant.dark,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/person4.png"),
                  ),
                  Container(
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: ColorsConstant.green3,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: MyText(
                            text: "4.6",
                            color: ColorsConstant.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700)),
                  ),
                  MyText(
                      text: "2d ago",
                      color: ColorsConstant.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ],
              ),
              const SizedBox(height: 10),
              MyText(
                  text:
                      "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello  how ar you? how ar you? how ar you? how ar you? how ar you? how ar you? how ar you?",
                  color: ColorsConstant.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400)
            ],
          ),
        ),
      ),
    );
  }
}
