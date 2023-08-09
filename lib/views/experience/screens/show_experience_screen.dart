import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_show_field.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';

class ShowExperienceScreen extends GetView {
  const ShowExperienceScreen({Key? key}) : super(key: key);
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
            '#ID Experience',
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
          title: 'Experience name',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildImage('image'),
              const VerticalSizedBox(35),
              const CustomShowField(
                title: 'name of the experience',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'name of the place',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Work place country',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Beginning work',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'National ID',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'work is finished',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Is he on top of his work.',
              ),
              const VerticalSizedBox(15),
            ],
          ),
        ),
      ),
    );
  }
}
