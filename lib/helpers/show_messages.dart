import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_text_button.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

const noCONNECTIONMSG =
    'Seems that you lost network connection \nPlease verify your connection and try later!';

class ShowAnyMessages {
  static Future<void> noConnMsg(
      // BuildContext context
      ) async {
    await showDialogMessage(
      // context,
      noCONNECTIONMSG,
      'Connection Lost',
      icon: 'no wifi',
    );
  }

  static Future<void> faildTask(
      // BuildContext context,
      String message,
      {String title = 'Task Fiald',
      bool showIcon = true}) async {
    await showDialogMessage(
      // context,
      message,
      title,
      icon: showIcon ? 'faild' : null,
    );
  }

  static Future<void> showDialogMessage(
      // BuildContext context,
      String message,
      String title,
      {String? icon}) async {
    final context = Get.context!;
    await showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: FontSizes.h6?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const VerticalSizedBox(30),
              if (icon != null)
                ImageHelpers.getLottieAssetImage(
                  300,
                  200,
                  icon,
                ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: FontSizes.h8?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // title: Row(
          //   children: [
          //     AppInfo.appIcon(),
          //     // const HorizantalSizedBox(12),
          //     // Text(
          //     //   title,
          //     // ),
          //   ],
          // ),
          actions: [
            Center(
              child: CustomTextButton(
                onPressed: () {
                  Get.back();
                },
                allowOnlineOnly: false,
                allowRegisterOnly: false,
                title: 'OK',
                style: TextButton.styleFrom(
                  textStyle: FontSizes.h7?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // textStyle: FontSizes.h7?.copyWith(
                //   fontWeight: FontWeight.bold,
                //   colo
                // ),
              ),
            ),
          ],
        );
      },
      barrierDismissible: false,
    );
  }

  static void showSnackBar(
    String message, {
    bool isError = false,
    bool floating = true,
    bool isSuccess = false,
  }) {
    Get.closeCurrentSnackbar();
    // final context = Get.context!;
    // ScaffoldMessenger.of(context).hideCurrentSnackBar();
    Get.showSnackbar(
      GetSnackBar(
        messageText: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: isSuccess
            ? ColorsConstant.appbarColor
            : isError
                ? Colors.red
                : ColorsConstant.snackbarNoramlBackground,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(seconds: 1),
        overlayBlur: 0.3,
        barBlur: 0.5,
        borderRadius: 20.r,
        margin: CustomEdgeInsets.all(12),
      ),
    );

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     behavior: floating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
    //     content: Text(
    //       message,
    //       softWrap: true,
    //     ),
    //     backgroundColor: isSuccess
    //         ? Colors.green
    //         : isError
    //             ? Colors.red
    //             : null,
    //   ),
    // );
  }

  static void showToastMSG(String message) async {
    Get.closeCurrentSnackbar();
    Get.showSnackbar(
      GetSnackBar(
        messageText: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: ColorsConstant.snackbarNoramlBackground,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(seconds: 1),
        overlayBlur: 0.5,
        barBlur: 0.5,
      ),
    );
  }
}
