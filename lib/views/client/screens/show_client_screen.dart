import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_show_field.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';

class ShowClientScreen extends GetView {
  const ShowClientScreen({Key? key}) : super(key: key);
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
            '#ID Client',
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

  Widget _buildTextFieldHelper(Widget first, Widget second) {
    return Row(
      children: [
        const HorizantalSizedBox(20),
        first,
        const HorizantalSizedBox(6),
        Flexible(
          flex: 3,
          child: second,
        ),
        const HorizantalSizedBox(20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'Client name',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildImage('image'),
              const VerticalSizedBox(35),
              _buildTextFieldHelper(
                const CustomShowField(
                  horizantalMargin: 0,
                  title: 'Main',
                ),
                const CustomShowField(
                  horizantalMargin: 0,
                  title: 'First Name',
                ),
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'second and last name',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'name of the client\'s company',
              ),
              const VerticalSizedBox(15),
              _buildTextFieldHelper(
                const CustomShowField(
                  horizantalMargin: 0,
                  title: 'Main',
                ),
                const CustomShowField(
                  horizantalMargin: 0,
                  title: 'phone number',
                ),
              ),
              const VerticalSizedBox(15),
              _buildTextFieldHelper(
                const CustomShowField(
                  horizantalMargin: 0,
                  title: 'Main',
                ),
                const CustomShowField(
                  horizantalMargin: 0,
                  title: 'Email',
                ),
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'attributed to',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Customer address',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Customer address 1',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'City',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Interrupt',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'ZIP code',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Country',
              ),
              const VerticalSizedBox(15),
            ],
          ),
        ),
      ),
    );
  }
}
