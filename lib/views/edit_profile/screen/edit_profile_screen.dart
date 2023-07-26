import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../helpers/validators.dart';
import '../../../utiles/app_background.dart';
import '../../../utiles/buttons_utiles/my_button.dart';
import '../../../utiles/form_utiles/my_drop_down_field.dart';
import '../../../utiles/form_utiles/my_text_form_field.dart';
import '../../../utiles/my_text.dart';
import '../../../utiles/upload_image_widget.dart';
import '../../review/widget/review_app_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      showImage: false,
      child: SafeArea(
          child: Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: const ReviewsAppBar(title: "EDIT PROFILE"),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
          child: MyButton(
              color: ColorsConstant.blackBlue,
              widget: MyText(
                  text: "Save",
                  color: ColorsConstant.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
              function: () {}),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Center(
                  child: UploadImageWidget(
                    radius: 65,
                    bacImage: "assets/images/person4.png",
                    circleHeight: 120,
                    circleWidth: 120,
                  ),
                ),
                SizedBox(height: 40.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: hintText.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        MyTextFormField(
                          enabledBorderColor: ColorsConstant.black,
                          focusedBorderColor: ColorsConstant.blackBlue,
                          textColor: ColorsConstant.grey,
                          fillColor: Colors.transparent,
                          validator: index == 5
                              ? Validators.validateEmail
                              : Validators.checkIfNotEmpty,
                          hintText: hintText[index],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                      ],
                    );
                  },
                ),
                DropDownButton(
                    list: bloodType, value: bloodType[0], hint: "Blood Type"),
                SizedBox(
                  height: 16.h,
                ),
                DropDownButton(
                    list: genderType,
                    value: genderType[0],
                    hint: "Gender Type"),
                SizedBox(
                  height: 16.h,
                ),
                DropDownButton(
                    list: nationality,
                    value: nationality[0],
                    hint: "Nationality"),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

List<String> hintText = [
  "Full Name",
  "Username",
  "Date of Birth",
  "National Number",
  "Phone Number",
  "E-mail",
  "Home Address",
  "Height cm",
  "Wight kg",
];

List<String> bloodType = [
  "Blood Type",
  "A",
  "B",
  "C",
];

List<String> genderType = [
  "Gender",
  "male",
  "female",
];

List<String> nationality = [
  "Syrian",
  "jordan",
  "palastine",
];
