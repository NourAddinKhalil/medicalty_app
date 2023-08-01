import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class DoctorInfoWithBook extends StatelessWidget {
  const DoctorInfoWithBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 20,
        shadowColor: ColorsConstant.dark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 90.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/person4.png",
                        ),
                      ),
                    ),
                  ),
                  MyText(
                    text: "Next available\n11PM today",
                    color: ColorsConstant.black,
                    fontSize: 15.sp,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                          text: "Dr.Blessing",
                          color: ColorsConstant.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                      MyText(
                          text: "Specialist Dentist",
                          color: ColorsConstant.blackGrey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 18.h,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Icon(Icons.star,
                                  size: 10.sp, color: ColorsConstant.yellow);
                            }),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: ColorsConstant.red,
                      )),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorsConstant.blackBlue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyText(
                            text: "Book now",
                            color: ColorsConstant.white,
                            fontSize: 15.sp),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
