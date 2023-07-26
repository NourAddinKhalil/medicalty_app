import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/app_background.dart';
import '../../../utiles/buttons_utiles/my_button.dart';
import '../../../utiles/my_text.dart';
import '../widget/read_all_reviews_widget.dart';
import '../widget/review_card.dart';

class TrainerDetailScreen extends StatelessWidget {
  const TrainerDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      showImage: false,
      child: Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
            child: MyButton(
                color: ColorsConstant.blackBlue,
                widget: MyText(
                    text: "Book an appointment",
                    color: ColorsConstant.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700),
                function: () {}),
          ),
          // backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: ColorsConstant.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                      )),
                    )),
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/person4.png",
                    fit: BoxFit.cover,
                  ),
                ),
                backgroundColor: ColorsConstant.blue,
                expandedHeight: 170,
                leading: IconButton(
                  icon: Icon(Icons.chevron_left,
                      size: 33.sp, color: ColorsConstant.blackGrey),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                        text: "Jennifer James",
                                        color: ColorsConstant.black,
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w700),
                                    MyText(
                                        text: "Functional Strength",
                                        color: ColorsConstant.black,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400),
                                  ]),
                              const Spacer(),
                              Image.asset(
                                "assets/images/call_button.png",
                                height: 50.h,
                                width: 50.w,
                              )
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: ColorsConstant.blackBlue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0.sp),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        MyText(
                                            text: "6",
                                            color: ColorsConstant.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700),
                                        MyText(
                                            text: "Experience",
                                            color: ColorsConstant.white,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                    Container(
                                        height: 40.h,
                                        width: 1.w,
                                        color: ColorsConstant.blackWhite),
                                    Column(
                                      children: [
                                        MyText(
                                            text: "46",
                                            color: ColorsConstant.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700),
                                        MyText(
                                            text: "Completed",
                                            color: ColorsConstant.white,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                    Container(
                                        height: 40.h,
                                        width: 1.w,
                                        color: ColorsConstant.blackWhite),
                                    Column(
                                      children: [
                                        MyText(
                                            text: "25",
                                            color: ColorsConstant.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700),
                                        MyText(
                                            text: "Active trainer",
                                            color: ColorsConstant.white,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              MyText(
                                  text: "Reviews",
                                  color: ColorsConstant.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600),
                              const Spacer(),
                              Container(
                                width: 60.w,
                                decoration: BoxDecoration(
                                    color: ColorsConstant.blackBlue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: MyText(
                                        text: "4.6",
                                        color: ColorsConstant.green3,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600)),
                              )
                            ],
                          ),
                          SizedBox(height: 5.h),
                          const ReadAllReviews(),
                          SizedBox(height: 20.h),
                          SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return const ReviewCard();
                                }),
                          )
                        ]),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
