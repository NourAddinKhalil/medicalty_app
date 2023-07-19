import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_switch.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'Notification',
          backOnRightSide: true,
          icon: Icons.arrow_forward_ios,
        ),
        body: SafeArea(
          child: Padding(
            padding: CustomEdgeInsets.symmetric(8, 16),
            child: Column(
              children: [
                const VerticalSizedBox(20),
                Text(
                  'Receive push notification on your mobile or table devices',
                  style: FontSizes.h6,
                ),
                CustomSwitch(
                  title: 'Today’s schedule changed ',
                  enabled: false,
                  backgroundColor: Colors.transparent,
                  updateSwitch: (newVal) {},
                ),
                CustomSwitch(
                  title: 'New request',
                  enabled: false,
                  backgroundColor: Colors.transparent,
                  updateSwitch: (newVal) {},
                ),
                CustomSwitch(
                  title: 'Client viewed quote ',
                  enabled: false,
                  backgroundColor: Colors.transparent,
                  updateSwitch: (newVal) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
