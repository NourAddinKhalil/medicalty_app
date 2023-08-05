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
import 'package:medicalty/views/attatchment/widgets/selected_attatchment_frame_widget.dart';

class ShowDiseaseScreen extends GetView {
  const ShowDiseaseScreen({Key? key}) : super(key: key);
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
            '#ID Disease',
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
          title: 'Appointment booking',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildImage('image'),
              const VerticalSizedBox(35),
              const CustomShowField(
                title: 'the name of the disease',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Description of the disease',
                minHeight: 120,
                alignment: Alignment.topLeft,
              ),
              const VerticalSizedBox(15),
              SelectItemButton(
                title: 'Result Image',
                onTab: () {},
              ),
              const VerticalSizedBox(15),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                children: ['.mp4', '.mp3', '.mvv'].map((e) {
                  return SelectedAttatchmentFrameWidget(
                    file: e,
                    child: const SizedBox(),
                  );
                }).toList(),
              ),
              const VerticalSizedBox(15),
              SelectItemButton(
                title: 'Videos',
                onTab: () {},
              ),
              const VerticalSizedBox(15),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                children: ['.mp4', '.mp3', '.mvv'].map((e) {
                  return SelectedAttatchmentFrameWidget(
                    file: e,
                    child: const SizedBox(),
                  );
                }).toList(),
              ),
              const VerticalSizedBox(15),
            ],
          ),
        ),
      ),
    );
  }
}
