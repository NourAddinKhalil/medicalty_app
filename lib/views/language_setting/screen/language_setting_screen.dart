import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/buttons_utiles/my_radio_button.dart';
import '../../review/widget/review_app_bar.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorsConstant.dark,
          appBar: const ReviewsAppBar(
              title: "LANGUAGE", titleColor: ColorsConstant.blackWhite),
          body: Column(
            children: [
              SizedBox(height: 20.h),
              const MyRadioButton(title: "English", value: "english"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:
                    Divider(thickness: 1.sp, color: ColorsConstant.blackGrey),
              ),
              const MyRadioButton(title: "Arabic", value: "arabic"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:
                    Divider(thickness: 1.sp, color: ColorsConstant.blackGrey),
              ),
            ],
          )),
    );
  }
}
