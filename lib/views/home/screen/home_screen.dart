// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/utiles/app_background.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/form_utiles/my_text_form_field.dart';
import '../../../utiles/my_text.dart';
import '../../patient/widget/best_doctor_card.dart';
import '../../patient/widget/doctor_info_card.dart';
import '../../patient/widget/doctor_info_card_with_book.dart';
import '../../patient/widget/head_screen_widget.dart';
import '../../patient/widget/linear_gradient_widget.dart';
import '../../patient/widget/see_all_widget.dart';
import '../../patient/widget/social_worker_card.dart';
import '../widget/best_doctor_tile_widget.dart';
import '../widget/book_now_card.dart';
import '../widget/meal_plans_widget.dart';
import '../widget/medical_centers_widget.dart';
import '../widget/paid_ads_widget.dart';
import '../widget/session_info_widget.dart';
import '../widget/show_categories_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    SizedBox(height: 30.h),
                    const BookNowCard(),
                    SizedBox(height: 20.h),
                    MyText(
                        text: "Select your goal",
                        color: ColorsConstant.black,
                        fontSize: 20.sp),
                    SizedBox(height: 10.h),
                    MedicalCentersWidget(textOfCard: selectYourGoalText),
                    SizedBox(height: 20.h),
                    SeeAllWidget(
                        seeAllFunction: () {}, whatToSeeAll: "Categoty"),
                    SizedBox(height: 10.h),
                    const ShowCategoriesWidget(),
                    SizedBox(height: 20.h),
                    Divider(
                      thickness: 1.sp,
                      color: ColorsConstant.black,
                    ),
                    SizedBox(height: 20.h),
                    SeeAllWidget(
                        seeAllFunction: () {}, whatToSeeAll: "Popular Doctors"),
                    SizedBox(height: 10.h),
                    const SessionInfoWidget(),
                    SizedBox(height: 10.h),
                    SeeAllWidget(
                        seeAllFunction: () {}, whatToSeeAll: "Meal Plans"),
                    SizedBox(height: 20.h),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const MealPlansWidget();
                        }),
                    SeeAllWidget(
                        whatToSeeAll: "Best Doctors", seeAllFunction: () {}),
                    SizedBox(height: 20.h),
                    const BestDoctorTileWidget(),
                    SizedBox(
                      height: 20.h,
                    ),
                    SeeAllWidget(
                        whatToSeeAll: "Paid ads", seeAllFunction: () {}),
                    SizedBox(
                      height: 20.h,
                    ),
                    const PaidAdsWidget(),
                    SizedBox(
                      height: 20.h,
                    ),
                    SeeAllWidget(
                        whatToSeeAll: "The Best Doctors",
                        seeAllFunction: () {}),
                    SizedBox(
                      height: 10.h,
                    ),
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
                    SizedBox(
                      height: 20.h,
                    ),
                    ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const DoctorInfoCard();
                        }),
                    SizedBox(height: 20.h),
                    MyText(
                        text: "Book Now",
                        color: ColorsConstant.black,
                        fontSize: 20.sp),
                    SizedBox(height: 10.h),
                    MedicalCentersWidget(textOfCard: bookNowText),
                    SizedBox(height: 20.h),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const DoctorInfoWithBook();
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                    const PaidAdsWidget(),
                    SizedBox(
                      height: 20.h,
                    ),
                    SeeAllWidget(
                        whatToSeeAll: "Popular Doctors", seeAllFunction: () {}),
                    SizedBox(
                      height: 10.h,
                    ),
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
                    SizedBox(height: 20.h),
                    MyText(
                        text: "Social Worker",
                        color: ColorsConstant.black,
                        fontSize: 20.sp),
                    SizedBox(height: 10.h),
                    ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const SocialWorkerCard();
                        }),
                    SizedBox(height: 20.h),
                    MyText(
                        text: "nutrition",
                        color: ColorsConstant.black,
                        fontSize: 20.sp),
                    SizedBox(height: 10.h),
                    ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const SocialWorkerCard();
                        }),
                    SizedBox(height: 20.h),
                    SeeAllWidget(
                        whatToSeeAll: "Paid ads", seeAllFunction: () {}),
                    SizedBox(height: 10.h),
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
                    SizedBox(height: 20.h),
                    SeeAllWidget(
                        whatToSeeAll: "natural therapy", seeAllFunction: () {}),
                    SizedBox(height: 10.h),
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
                    SizedBox(height: 20.h),
                    MyText(
                        text: "Medical Centers",
                        color: ColorsConstant.black,
                        fontSize: 20.sp),
                    const SizedBox(height: 10),
                    MedicalCentersWidget(textOfCard: medicalCentersText),
                    SizedBox(height: 20.h),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const DoctorInfoWithBook();
                        }),
                    SizedBox(height: 20.h),
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

List<String> selectYourGoalText = [
  "Medical Center",
  "treatment centres",
  "Pharmacies",
  "Other",
];

List<String> medicalCentersText = [
  "All",
  "Dentist",
  "Cardiiology",
  "Other",
];
