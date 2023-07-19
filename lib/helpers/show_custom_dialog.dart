import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/gen/fonts.gen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/custom_file_picker.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/utiles.dart';
import 'package:medicalty/services/app_info.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_elevated_button.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_text_button.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class ShowCustomDialog {
  static void showCustomAboutDialog() {
    Get.generalDialog(
      pageBuilder: (ctx, animation, secondaryAnimation) {
        return AlertDialog(
          title: Row(
            children: [
              AppInfo.appIcon(),
              const HorizantalSizedBox(15.0),
              AppInfo.getAppInfo,
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalSizedBox(15),
              ImageHelpers.getLottieAssetImage(
                200,
                200,
                'Assets.lottieIcons.aboutUs',
              ),
              const VerticalSizedBox(15),
              CustomTextButton(
                allowRegisterOnly: false,
                title: 'الإطلاع على سياسة الخصوصية',
                onPressed: () {
                  // Get.toNamed(Routes.privacyPolicyScreen);
                },
              ),
            ],
          ),
          actions: [
            CustomTextButton(
              onPressed: () {
                // Navigator.of(ctx).pop();
                Get.back();
              },
              allowOnlineOnly: false,
              allowRegisterOnly: false,
              title: 'موافق',
              style: TextButton.styleFrom(
                textStyle: FontSizes.h7?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showContactUsDialog() async {
    Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) {
        final theme = Theme.of(context);
        return AlertDialog(
          title: Row(
            children: [
              AppInfo.appIcon(),
              const HorizantalSizedBox(20),
              AppInfo.getAppInfo,
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'للتواصل معنا',
                style: FontSizes.h6?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const VerticalSizedBox(15),
              ImageHelpers.getLottieAssetImage(
                500,
                400,
                '',
              ),
              const VerticalSizedBox(15),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'يرجى التواصل معنا عير الإيميل:\n',
                  style: FontSizes.h5?.copyWith(
                    color: theme.textTheme.bodyLarge?.color,
                    fontFamily: FontFamily.switzerComplete,
                  ),
                  children: [
                    TextSpan(
                      style: FontSizes.h5?.copyWith(
                        color: theme.appBarTheme.actionsIconTheme?.color,
                        decoration: TextDecoration.underline,
                      ),
                      text: 'email\n',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Utiles.email('emial');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                // Navigator.of(context).pop();
              },
              child: Text(
                'موافق',
                style: FontSizes.h7?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static GestureRecognizer _call(String number) {
    return TapGestureRecognizer()
      ..onTap = () {
        Utiles.call(number);
      };
  }

  static TextSpan span(
    String number,
    Color? color, {
    bool isLast = false,
  }) {
    return TextSpan(
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        decoration: TextDecoration.underline,
      ),
      text: '$number ${(isLast ? '' : '\n')} ',
      recognizer: _call(number),
    );
  }

  static Future<List<String>> showCustomDialogPicker(
      // BuildContext context,
      //   Future<String?>(
      //     ImageSource imageSource, {
      //     bool isCircle,
      //     bool saveIntoDevice,
      //   })
      //       imageHandeler,
      {
    bool isCircle = false,
    bool saveToDevice = false,
    bool multiSelect = true,
    bool showIcons = true,
  }) async {
    Widget buildBody(
      String title,
      String imagePath, {
      bool atStart = true,
      bool isHeader = false,
      void Function()? onTab,
    }) {
      return Material(
        color: Colors.transparent,
        child: SizedBox(
          width: double.infinity,
          child: InkWell(
            radius: 12.r,
            onTap: onTab,
            child: Row(
              mainAxisAlignment:
                  atStart ? MainAxisAlignment.start : MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showIcons)
                  SizedBox(
                    width: 25.w,
                    child: ImageHelpers.getSVGAssetImage(
                      20,
                      20,
                      pic: imagePath,
                    ),
                  ),
                // Icon(
                //   icon,
                //   size: 40.sp,
                //   color: Colors.white,
                // ),
                const HorizantalSizedBox(10),
                Text(
                  title,
                  style: FontSizes.h7?.copyWith(
                    fontSize: isHeader
                        ? null
                        : showIcons
                            ? FontSizes.h7?.fontSize
                            : FontSizes.h8?.fontSize,
                    fontWeight: isHeader ? FontWeight.bold : FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return await Get.generalDialog<List<String>>(
          barrierDismissible: false,
          barrierLabel: 'SelectMethod',
          pageBuilder: (context, animation, secondaryAnimation) {
            return Center(
              child: Container(
                // height: 250.h,
                width: 300.w,
                padding: CustomEdgeInsets.symmetric(10, 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: ColorsConstant.tableBlack,
                ),
                child: Padding(
                  padding: CustomEdgeInsets.symmetric(5, 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const VerticalSizedBox(15),
                      buildBody(
                        'Attach File',
                        Assets.icons.attatchFile,
                        atStart: !showIcons, // false,
                        isHeader: true,
                      ),
                      const VerticalSizedBox(10),
                      buildBody(
                        'Take a photo',
                        Assets.icons.takePhoto,
                        onTab: () async {
                          final imagePath =
                              await CustomFilePicker.showImagePicker(
                            ImageSource.camera,
                            isCircle: isCircle,
                            saveIntoDevice: saveToDevice,
                          );
                          Get.back(
                            result: imagePath == null ? [] : [imagePath],
                          );
                        },
                        isHeader: true,
                      ),
                      const VerticalSizedBox(10),
                      buildBody(
                        'Take a video',
                        Assets.icons.takeVideo,
                        onTab: () async {
                          final videoPath =
                              await CustomFilePicker.showVideoPicker(
                            ImageSource.camera,
                            isCircle: isCircle,
                            saveIntoDevice: saveToDevice,
                          );
                          Get.back(
                            result: videoPath == null ? [] : [videoPath],
                          );
                        },
                        isHeader: true,
                      ),
                      const VerticalSizedBox(10),
                      buildBody(
                        'Choose photos & videos',
                        Assets.icons.choosePhotoVideo,
                        onTab: () async {
                          final filesPaths =
                              await CustomFilePicker.showFilePicker(
                            allowMultiple: multiSelect,
                          );
                          Get.back(result: filesPaths);
                        },
                        isHeader: true,
                      ),
                      const VerticalSizedBox(10),
                      buildBody(
                        'Choose a documents',
                        Assets.icons.chooseDocument,
                        onTab: () async {
                          final filesPaths =
                              await CustomFilePicker.showFilePicker(
                            allowMultiple: multiSelect,
                          );

                          Get.back(result: filesPaths);
                        },
                        isHeader: true,
                      ),
                      const VerticalSizedBox(13),
                      Align(
                        alignment: showIcons
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: CustomElevatedButton(
                          title: 'Cancel'.toUpperCase(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: showIcons
                                ? ColorsConstant.green2
                                : Colors.white,
                            foregroundColor: showIcons
                                ? Colors.white
                                : ColorsConstant.green2,
                            elevation: showIcons ? null : 0,
                            padding: CustomEdgeInsets.symmetric(0, 10),
                            textStyle: FontSizes.h8?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          allowOnlineOnly: false,
                          allowRegisterOnly: false,
                          onPressed: () {
                            Get.back(result: <String>[]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ) ??
        [];

    // return Get.dialog<String>(
    //   Center(
    //     child: SizedBox(
    //       height: 380.h,
    //       width: 380.h,
    //       child: ColoredBox(
    //         color: Colors.white,
    //         child: Padding(
    //           padding: CustomEdgeInsets.all(16.0),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               const VerticalSizedBox(42),
    //               TextButton.icon(
    //                 icon: const Icon(Icons.photo_library_outlined),
    //                 label: const Text('المعرض'),
    //                 onPressed: () async {
    //                   // final imagePath = await imageHandeler(
    //                   //   ImageSource.gallery,
    //                   //   isCircle: isCircle,
    //                   //   saveIntoDevice: saveToDevice,
    //                   // );
    //                   Get.back(result: 'imagePath');
    //                   // if (context.mounted) {
    //                   //   Navigator.of(context).pop(imagePath);
    //                   // }
    //                 },
    //               ),
    //               const VerticalSizedBox(42),
    //               TextButton.icon(
    //                 icon: const Icon(Icons.camera_outlined),
    //                 label: const Text('كاميرا'),
    //                 onPressed: () async {
    //                   // final imagePath = await imageHandeler(
    //                   //   ImageSource.camera,
    //                   //   isCircle: isCircle,
    //                   //   saveIntoDevice: saveToDevice,
    //                   // );
    //                   Get.back(result: 'imagePath');
    //                   // if (context.mounted) {
    //                   //   Navigator.of(context).pop(imagePath);
    //                   // }
    //                 },
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  ///the default is yes or no question
  ///to customize it edit the 'yse' ,'no' parameters
  static Future<bool> showConfirmationDialogMessage(
    // BuildContext context,
    String message,
    String title, {
    String yseBtn = 'Yes',
    String noBtn = 'No',
    String? icon,
    bool textBtnStyle = false,
  }) async {
    return await Get.defaultDialog<bool>(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text(
              //   title,
              //   style: TextStyle(
              //     fontSize: 46.sp,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              // const VerticalSizedBox(30),
              if (icon != null)
                ImageHelpers.getLottieAssetImage(
                  200,
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
          title: title,
          titleStyle: FontSizes.h6?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          titlePadding: CustomEdgeInsets.only(top: 15),
          actions: [
            if (!textBtnStyle)
              CustomElevatedButton(
                allowOnlineOnly: false,
                allowRegisterOnly: false,
                title: yseBtn,
                onPressed: () {
                  // Navigator.of(ctx).pop(true);
                  Get.back(result: true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsConstant.blue,
                  foregroundColor: Colors.white,
                  padding: CustomEdgeInsets.all(5),
                  textStyle: FontSizes.h8?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (!textBtnStyle)
              CustomElevatedButton(
                allowOnlineOnly: false,
                allowRegisterOnly: false,
                title: noBtn,
                onPressed: () {
                  // Navigator.of(ctx).pop(true);
                  Get.back(result: false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsConstant.black,
                  foregroundColor: Colors.white,
                  padding: CustomEdgeInsets.all(5),
                  textStyle: FontSizes.h8?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (textBtnStyle)
              CustomTextButton(
                allowOnlineOnly: false,
                allowRegisterOnly: false,
                title: yseBtn,
                onPressed: () {
                  // Navigator.of(ctx).pop(true);
                  Get.back(result: true);
                },
                style: TextButton.styleFrom(
                  foregroundColor: ColorsConstant.blue,
                  textStyle: FontSizes.h8?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (textBtnStyle)
              CustomTextButton(
                allowOnlineOnly: false,
                allowRegisterOnly: false,
                title: noBtn,
                onPressed: () {
                  // Navigator.of(ctx).pop(true);
                  Get.back(result: false);
                },
                style: TextButton.styleFrom(
                  foregroundColor: ColorsConstant.black,
                  textStyle: FontSizes.h8?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ) ??
        false;
  }

  static Future<bool> notLoggedInUser() async {
    final log = await showConfirmationDialogMessage(
      // context,
      'You must have an account to continue this operation',
      'Not registered',
      noBtn: 'Cancel',
      yseBtn: 'Create account',
      icon: '',
    );
    return log;
  }

  static Future<void> notLoggedInUserWithNavigation(
      // BuildContext context
      ) async {
    final log = await notLoggedInUser();

    if (log) {
      // Get.toNamed(Routes.register);
    }
  }
}
