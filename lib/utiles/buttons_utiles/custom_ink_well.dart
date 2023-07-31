import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/api_controllers/connection_controller.dart';
import 'package:medicalty/helpers/show_messages.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    Key? key,
    required this.onTap,
    required this.child,
    this.allowOnlineOnly = true,
    this.allowRegisterOnly = true,
  }) : super(key: key);
  final void Function()? onTap;
  final Widget child;
  final bool allowRegisterOnly;
  final bool allowOnlineOnly;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap == null
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
              if (onTap != null) {
                onTap!();
              }
            },
      child: child,
    );
  }
}
