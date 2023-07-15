import 'package:flutter/material.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_elevated_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class ServerProblemScreen extends StatelessWidget {
  const ServerProblemScreen({
    Key? key,
    this.tryAgain,
    this.moreErrorInfo = '',
  }) : super(key: key);
  final void Function()? tryAgain;
  final String moreErrorInfo;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        // alignment: Alignment.center,
        padding: CustomEdgeInsets.horizontal(20),
        child: SingleChildScrollView(
          primary: false,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageHelpers.getSVGAssetImage(
                380,
                344,
                pic: Assets.svgs.serverProblem,
              ),
              const VerticalSizedBox(15),
              Text(
                'There is a problem with the server',
                textAlign: TextAlign.center,
                style: FontSizes.h6?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const VerticalSizedBox(8),
              Text(
                'An error occurred while retrieving information from the server\n$moreErrorInfo',
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
                onPressed: tryAgain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
