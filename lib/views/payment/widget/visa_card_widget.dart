import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class VisaCard extends StatelessWidget {
  const VisaCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10),
      child: Container(
        width: 150.w,
        height: 115.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromARGB(255, 219, 12, 238),
                  Color.fromARGB(243, 69, 50, 238),
                  Color.fromARGB(243, 184, 98, 241),
                ])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Spacer(),
                  MyText(
                      text: "VISA",
                      color: ColorsConstant.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 2.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 5.sp,
                          ),
                        );
                      }),
                ),
                MyText(
                    text: "2048",
                    color: ColorsConstant.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700),
                Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.check,
                            size: 20.sp, color: ColorsConstant.green3)))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
