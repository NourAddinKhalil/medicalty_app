import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/api_controllers/connection_controller.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_elevated_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class InternetProblemScreen extends StatelessWidget {
  const InternetProblemScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        // alignment: Alignment.center,
        padding: CustomEdgeInsets.horizontal(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageHelpers.getSVGAssetImage(
              380,
              344,
              pic: Assets.svgs.noInternet,
            ),
            const VerticalSizedBox(15),
            Text(
              'There is a problem with the internet',
              textAlign: TextAlign.center,
              style: FontSizes.h6?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const VerticalSizedBox(8),
            Text(
              'Make sure that Wi-Fi or mobile data is turned on, then try again',
              textAlign: TextAlign.center,
              style: FontSizes.h7?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const VerticalSizedBox(35),
            CustomElevatedButton(
              allowOnlineOnly: false,
              allowRegisterOnly: false,
              title: 'Try Again',
              onPressed: () async {
                Get.find<ConnectionController>().reset();
                await Future.delayed(const Duration(milliseconds: 600));
                Get.find<ConnectionController>().listen();
              },
            ),
          ],
        ),
      ),
    );
  }
}
