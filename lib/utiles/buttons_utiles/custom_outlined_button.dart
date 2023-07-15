import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/api_controllers/connection_controller.dart';
import 'package:medicalty/helpers/show_messages.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.style,
    this.allowOnlineOnly = true,
    this.allowRegisterOnly = true,
    this.padding = 0.0,
    this.textStyle,
  });
  final String title;
  final void Function()? onPressed;
  final bool allowRegisterOnly;
  final bool allowOnlineOnly;
  final ButtonStyle? style;
  final double padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
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
                // final logged =
                //     Get.find<FirebaseAuthController>().isThereAUserLoggedin;
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

class CustomOutlinedIconButton extends StatelessWidget {
  const CustomOutlinedIconButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.style,
    this.allowOnlineOnly = true,
    this.allowRegisterOnly = true,
    this.padding = 0.0,
    this.textStyle,
    this.size = 30,
  });
  final String title;
  final void Function()? onPressed;
  final bool allowRegisterOnly;
  final bool allowOnlineOnly;
  final ButtonStyle? style;
  final double padding;
  final TextStyle? textStyle;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(
        icon,
        size: size.sp,
      ),
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
      label: Padding(
        padding: CustomEdgeInsets.all(padding),
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
