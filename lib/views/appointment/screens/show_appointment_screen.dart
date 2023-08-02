import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/select_item_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_show_field.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';

class ShowAppointmentScreen extends GetView {
  const ShowAppointmentScreen({Key? key}) : super(key: key);

  Widget _buildImage(String image) {
    return Center(
      child: CircleSqureImage(
        pic: image,
        width: 120,
        height: 120,
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
              const CustomShowField(
                title: 'doctor is selected',
              ),
              const VerticalSizedBox(15),
              _buildImage('image'),
              const VerticalSizedBox(35),
              CustomShowField(
                title: 'Doctor\'s job number - Auto full',
                fillColor: const Color(0x5B5B5B40).withOpacity(0.25),
                titleColor: Colors.white,
              ),
              const VerticalSizedBox(15),
              CustomShowField(
                title: 'doctor\'s name - Auto full',
                fillColor: const Color(0x5B5B5B40).withOpacity(0.25),
                titleColor: Colors.white,
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'assigned to the patient',
              ),
              const VerticalSizedBox(15),
              _buildImage('image'),
              const VerticalSizedBox(35),
              const CustomShowField(
                title: 'Patient name - Auto Full',
              ),
              const VerticalSizedBox(15),
              SelectItemButton(
                title: 'Multiple booking',
                iconOnEnd: true,
                iconColor: ColorsConstant.green1,
                onTab: () {},
              ),
              const VerticalSizedBox(25),
              const CustomShowField(
                title: 'Reservation time',
                icon: Icons.calendar_month,
              ),
              const VerticalSizedBox(15),
              Padding(
                padding: CustomEdgeInsets.horizontal(20),
                child: const Row(
                  children: [
                    Expanded(
                      child: CustomShowField(
                        title: 'Start time',
                        horizantalMargin: 0,
                      ),
                    ),
                    HorizantalSizedBox(5),
                    Expanded(
                      child: CustomShowField(
                        title: 'End time',
                        horizantalMargin: 0,
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSizedBox(15),
              const CustomShowField(
                title: 'Description of the disease',
                minHeight: 120,
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
