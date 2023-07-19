import 'package:flutter/material.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class UserTypesScreen extends StatelessWidget {
  const UserTypesScreen({super.key});

  Widget _buildContent({required String title, required String image}) {
    return Column(
      children: [
        ImageHelpers.getAssetImage(
          162,
          194,
          pic: image,
        ),
        const VerticalSizedBox(6),
        Text(
          title,
          style: FontSizes.h4?.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorsConstant.primaryColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.onPording4Back.path,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: CustomEdgeInsets.symmetric(4, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const VerticalSizedBox(20),
                Text(
                  'Pick one up to start now!',
                  style: FontSizes.h4?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorsConstant.primaryColor,
                  ),
                ),
                _buildContent(
                  title: 'I\'m a Patient',
                  image: Assets.images.patient.path,
                ),
                Wrap(
                  // spacing: 15,
                  runSpacing: 10,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    _buildContent(
                      title: 'I\'m a Doctor',
                      image: Assets.images.doctor.path,
                    ),
                    _buildContent(
                      title: 'I\'m a Nurse',
                      image: Assets.images.nurse.path,
                    ),
                    _buildContent(
                      title: 'Physiotherapy',
                      image: Assets.images.physiotherapy.path,
                    ),
                    _buildContent(
                      title: 'pharmacy',
                      image: Assets.images.pharmacy.path,
                    ),
                    _buildContent(
                      title: 'Hospital',
                      image: Assets.images.hospital.path,
                    ),
                    _buildContent(
                      title: 'Medical Center',
                      image: Assets.images.medicalCenter.path,
                    ),
                  ],
                ),
                const VerticalSizedBox(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
