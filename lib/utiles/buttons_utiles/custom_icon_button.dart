import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/api_controllers/connection_controller.dart';
import 'package:medicalty/helpers/show_messages.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.iconData,
    required this.tooltip,
    this.iconSize = 24,
    required this.onPressed,
    this.allowOnlineOnly = true,
    this.allowRegisterOnly = true,
    this.makeTheme = true,
    this.isError = false,
    this.style,
    this.iconColor,
  }) : super(key: key);
  final IconData? iconData;
  final String? tooltip;
  final void Function()? onPressed;
  final bool allowRegisterOnly;
  final bool allowOnlineOnly;
  final double iconSize;
  final bool makeTheme;
  final bool isError;
  final ButtonStyle? style;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context);
    return IconButton(
      alignment: Alignment.center,
      icon: Icon(
        iconData,
        size: iconSize.sp,
        color: isError ? themeColor.colorScheme.error : iconColor,
      ),
      tooltip: tooltip,
      style: style,
      color: isError
          ? themeColor.colorScheme.error
          : makeTheme
              ? themeColor.iconTheme.color
              : null,
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
      iconSize: iconSize.sp,
    );
  }
}
