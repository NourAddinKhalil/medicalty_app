import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_show_field.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';

class ShowPatientScreen extends GetView {
  const ShowPatientScreen({Key? key}) : super(key: key);
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
            '#ID Patient',
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
          title: 'Patient name',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildImage('image'),
              const VerticalSizedBox(35),
              const CustomShowField(
                title: 'Full name',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: '@username',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'File No.',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'date of birth',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'National ID',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'phone number',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Patient Email',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'home adress',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'patient\'s height CM',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Patient weight KG',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'blood type',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Chose name of the disease',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Description of the disease',
                minHeight: 120,
                alignment: Alignment.topLeft,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'gender',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Nationality',
              ),
              const VerticalSizedBox(15),
            ],
          ),
        ),
      ),
    );
  }
}
