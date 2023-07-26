import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class ReadAllReviews extends StatelessWidget {
  const ReadAllReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 115.w,
          child: Stack(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('assets/images/person4.png'),
              ),
              const Positioned(
                  left: 20,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/images/person4.png'),
                  )),
              const Positioned(
                  left: 40,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/images/person4.png'),
                  )),
              const Positioned(
                  left: 60,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/images/person4.png'),
                  )),
              Positioned(
                  left: 80,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: ColorsConstant.green3,
                    child: Center(
                      child: MyText(
                          text: "174",
                          color: ColorsConstant.black,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                    ),
                  )),
            ],
          ),
        ),
        const Spacer(),
        MyText(
            text: "Read all reviews",
            color: ColorsConstant.black,
            fontSize: 15,
            fontWeight: FontWeight.w400)
      ],
    );
  }
}
