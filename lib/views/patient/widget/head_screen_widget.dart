// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class HeadScreen extends StatelessWidget {
  const HeadScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/person4.png"),
            radius: 30,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
                text: "Hello, Good Morning",
                color: ColorsConstant.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
            MyText(
                text: "Sophia!",
                color: ColorsConstant.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600)
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset("assets/images/bell-icon.svg",
              color: ColorsConstant.black),
        )
      ],
    );
  }
}
