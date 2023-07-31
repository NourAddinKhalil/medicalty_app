import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/api_controllers/connection_controller.dart';
import 'package:medicalty/helpers/show_messages.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.style,
    this.allowOnlineOnly = true,
    this.allowRegisterOnly = true,
    this.padding = 0.0,
    this.textStyle,
  }) : super(key: key);
  final String title;
  final void Function()? onPressed;
  final bool allowRegisterOnly;
  final bool allowOnlineOnly;
  final ButtonStyle? style;
  final double padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
      style: style,
      child: Padding(
        padding: CustomEdgeInsets.all(padding),
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}

class CustomElevatedIconButton extends StatelessWidget {
  const CustomElevatedIconButton({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onPressed,
    this.allowOnlineOnly = true,
    this.allowRegisterOnly = true,
    this.style,
    this.buttonStyle,
    this.size = 30,
    this.angle = 0,
  }) : super(key: key);
  final IconData iconData;
  final String title;
  final void Function()? onPressed;
  final bool allowRegisterOnly;
  final bool allowOnlineOnly;
  final TextStyle? style;
  final ButtonStyle? buttonStyle;
  final double size;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Transform.rotate(
        angle: angle,
        child: Icon(
          iconData,
          size: size.sp,
        ),
      ),
      label: Text(
        title,
        style: style,
      ),
      style: buttonStyle,
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
