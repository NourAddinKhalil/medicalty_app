import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_show_field.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';

class ShowPharmacyScreen extends GetView {
  const ShowPharmacyScreen({Key? key}) : super(key: key);
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
            '#ID Pharmacy',
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
          title: 'Pharmacy name',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildImage('image'),
              const VerticalSizedBox(35),
              const CustomShowField(
                title: 'name of the pharmacy',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: '@username',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'phone number',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'phone number 1',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'E-mail',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'official e-mail',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Country',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Address',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Address 1',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'State name',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'District name',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Postal code',
              ),
              const VerticalSizedBox(20),
              Text(
                'Social media links for the center',
                textAlign: TextAlign.center,
                style: FontSizes.h7?.copyWith(
                  color: ColorsConstant.primaryColor,
                ),
              ),
              const VerticalSizedBox(20),
              const CustomShowField(
                title: 'Website',
                icon: FontAwesomeIcons.link,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Facebook',
                icon: FontAwesomeIcons.facebookF,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Instagram',
                icon: FontAwesomeIcons.instagram,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Twitter',
                icon: FontAwesomeIcons.twitter,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Snapchat',
                icon: FontAwesomeIcons.linkedin,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'YouTube',
                icon: FontAwesomeIcons.squareYoutube,
              ),
              const VerticalSizedBox(15),
            ],
          ),
        ),
      ),
    );
  }
}
