// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/utiles/app_background.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/form_utiles/my_text_form_field.dart';
import '../../../utiles/my_text.dart';
import '../widget/best_doctor_card.dart';
import '../widget/doctor_info_card.dart';
import '../widget/doctor_info_card_with_book.dart';
import '../widget/favorite_doctor_card.dart';
import '../widget/head_screen_widget.dart';
import '../widget/linear_gradient_widget.dart';
import '../widget/see_all_widget.dart';
import '../widget/social_worker_card.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      showImage: false,
      child: Scaffold(
          // backgroundColor: Colors.transparent,
          body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300.h,
            child: const LinearGradientContainer(
              beginAlignment: Alignment.topRight,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.0.w, bottom: 20.h, top: 20.h, right: 20.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeadScreen(),
                    SizedBox(height: 30.h),
                    MyTextFormField(
                      validator: () {},
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                    ),
                    SizedBox(height: 15.h),
                    Divider(
                      thickness: 1.sp,
                      color: ColorsConstant.black,
                    ),
                    SizedBox(height: 20.h),
                    SeeAllWidget(
                        seeAllFunction: () {},
                        whatToSeeAll: "Favorite Doctors"),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return const FavoriteDoctorCard();
                          }),
                    ),
                    const SizedBox(height: 20),
                    SeeAllWidget(
                        seeAllFunction: () {},
                        whatToSeeAll: "The Best Doctors"),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 250.h,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const BestDoctorCard();
                          }),
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const DoctorInfoCard();
                        }),
                    const SizedBox(height: 20),
                    MyText(
                        text: "Book Now",
                        color: ColorsConstant.black,
                        fontSize: 20.sp),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50.h,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: bookNowText.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50,
                              margin: EdgeInsets.only(right: 10.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorsConstant.blackGrey),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Center(
                                  child: MyText(
                                      text: bookNowText[index],
                                      color: ColorsConstant.black,
                                      fontSize: 17.sp),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const DoctorInfoWithBook();
                        }),
                    const SizedBox(height: 20),
                    MyText(
                        text: "Social Worker",
                        color: ColorsConstant.black,
                        fontSize: 20.sp),
                    const SizedBox(height: 20),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const SocialWorkerCard();
                        })
                  ]),
            ),
          )
        ],
      )),
    );
  }
}

List<String> bookNowText = [
  "All",
  "Dentist",
  "Cardiiology",
  "Other",
];
