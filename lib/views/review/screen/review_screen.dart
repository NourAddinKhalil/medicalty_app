import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utiles/app_background.dart';
import '../widget/review_app_bar.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/buttons_utiles/my_button.dart';
import '../../../utiles/my_text.dart';
import '../widget/review_body.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      showImage: false,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            // backgroundColor: Colors.transparent,
            appBar: const ReviewsAppBar(
              title: "REVIEWS",
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 40, right: 40),
              child: MyButton(
                  color: ColorsConstant.blackBlue,
                  widget: MyText(
                      text: "Write a Review",
                      color: ColorsConstant.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700),
                  function: () {},
                  Circular: 40),
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: ColorsConstant.blackBlue,
                            borderRadius: BorderRadius.circular(20)),
                        child: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: BoxDecoration(
                                color: ColorsConstant.green3,
                                borderRadius: BorderRadius.circular(20)),
                            labelColor: ColorsConstant.black,
                            indicatorColor: ColorsConstant.green3,
                            labelStyle: const TextStyle(
                                color: ColorsConstant.blackBlue),
                            unselectedLabelColor: ColorsConstant.white,
                            tabs: const [
                              Tab(
                                text: "Recent",
                              ),
                              Tab(text: "Critical"),
                              Tab(text: "Favourable")
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 700,
                      child: TabBarView(
                        children: [
                          const ReviewBody(),
                          Container(
                              width: 5,
                              height: 5,
                              color: ColorsConstant.accentBlue),
                          Container(
                              width: 5,
                              height: 5,
                              color: ColorsConstant.accentBlue),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
