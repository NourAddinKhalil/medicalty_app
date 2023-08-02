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

class ShowRequestScreen extends GetView {
  const ShowRequestScreen({Key? key}) : super(key: key);

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
            '#ID Request',
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
          title: 'Request name',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildImage('image'),
              const VerticalSizedBox(35),
              const CustomShowField(
                title: 'selection of clients/patients',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'address of the request',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Service details',
                minHeight: 120,
                alignment: Alignment.topLeft,
              ),
              const VerticalSizedBox(15),
              SelectItemButton(
                title: 'appointment, booking schedule',
                onTab: () {},
                icon: Icons.calendar_month,
                iconOnEnd: true,
                iconColor: Colors.white,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'comments',
                minHeight: 120,
                alignment: Alignment.topLeft,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Reservation times',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Choose the date',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'selection of clients/patients',
              ),
              const VerticalSizedBox(15),
              Padding(
                padding: CustomEdgeInsets.horizontal(20),
                child: const Row(
                  children: [
                    Expanded(
                      child: CustomShowField(
                        title: 'Starting time',
                        horizantalMargin: 0,
                      ),
                    ),
                    HorizantalSizedBox(5),
                    Expanded(
                      child: CustomShowField(
                        horizantalMargin: 0,
                        title: 'Ending time',
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'supervising physician',
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Notes',
                minHeight: 150,
                alignment: Alignment.topLeft,
              ),
              const VerticalSizedBox(15),
            ],
          ),
        ),
      ),
    );
  }
}
