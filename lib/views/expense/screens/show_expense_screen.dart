import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/select_item_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_show_field.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/attatchment/widgets/selected_attatchment_frame_widget.dart';

class ShowExpenseScreen extends GetView {
  const ShowExpenseScreen({Key? key}) : super(key: key);

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
            '#ID Expense',
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
          title: 'Expense name',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildImage('image'),
              const VerticalSizedBox(35),
              const CustomShowField(
                title: 'address',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'description',
                minHeight: 120,
                alignment: Alignment.topLeft,
              ),
              const VerticalSizedBox(15),
              Padding(
                padding: CustomEdgeInsets.horizontal(20),
                child: const Row(
                  children: [
                    Expanded(
                      child: CustomShowField(
                        title: 'time',
                        horizantalMargin: 0,
                      ),
                    ),
                    HorizantalSizedBox(5),
                    Expanded(
                      child: CustomShowField(
                        horizantalMargin: 0,
                        title: 'Date',
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'The value of the expense \$',
                fillColor: Color(0xFFC6FCFF),
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Pay for',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Accounting code',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Customer address 1',
              ),
              const VerticalSizedBox(15),
              SelectItemButton(
                title: 'Attach File',
                onTab: () {},
                iconOnEnd: true,
              ),
              const VerticalSizedBox(15),
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
