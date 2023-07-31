import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/api_controllers/connection_controller.dart';
import 'package:medicalty/helpers/show_messages.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.allowOnlineOnly = true,
    this.allowRegisterOnly = true,
    this.style,
    this.textStyle,
  }) : super(key: key);
  final String title;
  final void Function()? onPressed;
  final bool allowRegisterOnly;
  final bool allowOnlineOnly;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  // final bool whiteColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: style,
      onPressed: onPressed == null
          ? null
          : () async {
              FocusManager.instance.primaryFocus?.unfocus();
              if (allowOnlineOnly) {
                final online = Get.find<ConnectionController>().isOnline;
                if (!online) {
                  await ShowAnyMessages.noConnMsg();
                  return;
                }
              }
              if (allowRegisterOnly) {
                // final logged = Get.find<AuthController>().authenticated;
                // if (!logged) {
                //   await ShowCustomDialog.notLoggedInUserWithNavigation();
                //   return;
                // }
              }
              onPressed!();
            },
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}

class CustomTextIconButton extends StatelessWidget {
  const CustomTextIconButton({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onPressed,
    this.allowOnlineOnly = true,
    this.allowRegisterOnly = true,
    this.style,
    this.size = 30,
    this.angle = 0,
  }) : super(key: key);
  final IconData iconData;
  final String title;
  final ButtonStyle? style;
  final void Function()? onPressed;
  final bool allowRegisterOnly;
  final bool allowOnlineOnly;
  final double size;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Transform.rotate(
        angle: angle,
        child: Icon(
          iconData,
          size: size.sp,
        ),
      ),
      label: Text(title),
      style: style,
      onPressed: onPressed == null
          ? null
          : () async {
              FocusManager.instance.primaryFocus?.unfocus();
              if (allowOnlineOnly) {
                final online = Get.find<ConnectionController>().isOnline;
                if (!online) {
                  await ShowAnyMessages.noConnMsg();
                  return;
                }
              }
              if (allowRegisterOnly) {
                // final logged = Get.find<AuthController>().authenticated;
                // if (!logged) {
                //   await ShowCustomDialog.notLoggedInUserWithNavigation();
                //   return;
                // }
              }
              onPressed!();
            },
    );
  }
}
