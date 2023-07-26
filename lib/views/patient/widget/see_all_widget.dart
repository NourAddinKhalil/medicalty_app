import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class SeeAllWidget extends StatelessWidget {
  final String whatToSeeAll;
  final Function() seeAllFunction;
  const SeeAllWidget(
      {super.key, required this.whatToSeeAll, required this.seeAllFunction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyText(
            text: whatToSeeAll,
            color: ColorsConstant.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700),
        const Spacer(),
        InkWell(
          onTap: seeAllFunction,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: MyText(
                text: "see all",
                color: ColorsConstant.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
