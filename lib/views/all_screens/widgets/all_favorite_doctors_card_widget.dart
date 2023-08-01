import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/custom_sized_box.dart';
import '../../../utiles/my_text.dart';

class AllFvoriteDoctorsCardWidget extends StatelessWidget {
  const AllFvoriteDoctorsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
              elevation: 20,
              shadowColor: ColorsConstant.dark,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 90.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            color: ColorsConstant.yellow,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/doctor.png",
                              ),
                            ),
                          ),
                        ),
                        MyText(
                          text: "Next available\n11PM today",
                          color: ColorsConstant.black,
                          fontSize: 14.sp,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyText(
                            text: "Dr.Blessing",
                            color: ColorsConstant.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                        MyText(
                            text: "Specialist Dentist",
                            color: ColorsConstant.blackGrey,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold),
                        MyText(
                            text: "7 Years experience",
                            color: ColorsConstant.grey,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400),
                        MyText(
                            text: "78%      75 Patient Booking",
                            color: ColorsConstant.grey,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400),
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
                        const VerticalSizedBox(10),
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
        });
  }
}
