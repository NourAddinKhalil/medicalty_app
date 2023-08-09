import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/select_item_button.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_show_field.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';

class ShowEmployeeScreen extends GetView {
  const ShowEmployeeScreen({Key? key}) : super(key: key);

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
            '#ID Employee',
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
          title: 'Employee name',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildImage('image'),
              const VerticalSizedBox(35),
              const CustomShowField(
                title: 'Employee Name',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: '@username',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Hourly salary',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Total salary',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'date of birth',
                icon: Icons.calendar_month,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'belongs to',
              ),
              const VerticalSizedBox(15),
              SelectItemButton(
                title: 'Multiple working',
                iconOnEnd: true,
                iconColor: ColorsConstant.green1,
                onTab: () {},
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Work Time',
              ),
              const VerticalSizedBox(15),
            ],
          ),
        ),
      ),
    );
  }
}
