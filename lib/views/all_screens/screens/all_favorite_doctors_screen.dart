import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/custom_sized_box.dart';
import '../../../utiles/my_text.dart';
import '../../patient/widget/linear_gradient_widget.dart';
import '../widgets/all_favorite_doctors_card_widget.dart';

class AllFavoriteDoctorsScreen extends StatelessWidget {
  const AllFavoriteDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorsConstant.white,
          body: Stack(children: [
            SizedBox(
              width: double.infinity,
              height: 300.h,
              child: const LinearGradientContainer(
                beginAlignment: Alignment.topRight,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_left,
                                color: ColorsConstant.black)),
                        MyText(
                          text: "All favorite doctors",
                          color: ColorsConstant.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox()
                      ],
                    ),
                    const VerticalSizedBox(40),
                    const AllFvoriteDoctorsCardWidget(),
                  ],
                ),
              ),
            )
          ])),
    );
  }
}
