import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_show_field.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';

class ShowLabScreen extends GetView {
  const ShowLabScreen({Key? key}) : super(key: key);
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
            '#ID laboratory',
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
          title: 'laboratory name',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildImage('image'),
              const VerticalSizedBox(35),
              const CustomShowField(
                title: 'laboratory Name',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'address',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'phone number',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'E-mail',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'website',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'website',
                isPassword: true,
              ),
              const VerticalSizedBox(15),
            ],
          ),
        ),
      ),
    );
  }
}
