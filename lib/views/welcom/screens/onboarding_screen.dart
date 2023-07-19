import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_text_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/views/welcom/widgets/onboarding1.dart';
import 'package:medicalty/views/welcom/widgets/onboarding2.dart';
import 'package:medicalty/views/welcom/widgets/onboarding3.dart';
import 'package:medicalty/views/welcom/widgets/onboarding4.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  final pageChildren = const [
    Onboarding1(),
    Onboarding2(),
    Onboarding3(),
    Onboarding4(),
  ];
  var isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      // appBar: AppBar(),
      body: PageView(
        controller: controller,
        children: pageChildren,
        onPageChanged: (value) {
          if (value == pageChildren.length - 1 && !isLastPage) {
            setState(() {
              isLastPage = true;
            });
          } else {
            if (isLastPage) {
              setState(() {
                isLastPage = false;
              });
            }
          }
        },
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: (isLastPage)
          ? null
          : SizedBox(
              // padding: CustomEdgeInsets.only(bottom: 8),
              // color: ColorsConstant.accentBlue,
              width: double.infinity,
              child: Padding(
                padding: CustomEdgeInsets.horizontal(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButton(
                      allowOnlineOnly: false,
                      allowRegisterOnly: false,
                      title: 'Skip',
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        padding: CustomEdgeInsets.only(bottom: 15),
                        textStyle: FontSizes.h6?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        controller.jumpToPage(
                          (pageChildren.length - 1),
                          // duration: const Duration(milliseconds: 500),
                          // curve: Curves.bounceIn,
                        );
                      },
                    ),
                    SmoothPageIndicator(
                      controller: controller,
                      count: pageChildren.length,
                      onDotClicked: (index) {
                        controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.bounceIn,
                        );
                      },
                      effect: WormEffect(
                        spacing: 8,
                        activeDotColor: const Color(0xFFB0C929),
                        dotColor: ColorsConstant.blackBlue,
                        dotHeight: 13.h,
                        dotWidth: 16.w,
                      ),
                    ),
                    CustomTextButton(
                      allowOnlineOnly: false,
                      allowRegisterOnly: false,
                      title: 'Next',
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        padding: CustomEdgeInsets.only(bottom: 15),
                        textStyle: FontSizes.h6?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        controller.animateToPage(
                          (controller.page! + 1).floor(),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
