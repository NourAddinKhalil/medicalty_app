import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_show_field.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';

class ShowDoctorScreen extends GetView {
  const ShowDoctorScreen({Key? key}) : super(key: key);
  Widget _buildImage(String image) {
    return Center(
      child: Column(
        children: [
          CircleSqureImage(
            pic: image,
            width: 120,
            height: 120,
          ),
          const VerticalSizedBox(10),
          Text(
            '#ID Doctor',
            textAlign: TextAlign.center,
            style: FontSizes.h7?.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorsConstant.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'Doctor name',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildImage('image'),
              const VerticalSizedBox(35),
              const CustomShowField(
                title: 'choos department',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'choos job',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: '@username',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Job number',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Full name',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'National ID',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Job Description',
                minHeight: 120,
                alignment: Alignment.topLeft,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'About the doctor',
                minHeight: 120,
                alignment: Alignment.topLeft,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'comprehensive profile doctors',
                minHeight: 150,
                alignment: Alignment.topLeft,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'date of birth',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Years of Experience',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'experience',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'phone number',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Work phone number',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'E-mail',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Work email',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Gender',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Nationality',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'address',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'salary',
              ),
              const VerticalSizedBox(15),
            ],
          ),
        ),
      ),
    );
  }
}
