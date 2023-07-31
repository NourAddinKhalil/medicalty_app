import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/api_controllers/connection_controller.dart';
import 'package:medicalty/helpers/show_messages.dart';

class CustomPopupMenuItem extends StatelessWidget {
  const CustomPopupMenuItem({
    Key? key,
    required this.title,
    this.onTap,
    this.allowRegisterOnly = true,
    this.allowOnlineOnly = true,
  }) : super(key: key);
  final String title;
  final void Function()? onTap;
  final bool allowRegisterOnly;
  final bool allowOnlineOnly;

  @override
  Widget build(BuildContext context) {
    return PopupMenuItem(
      onTap: onTap == null
          ? null
          : () async {
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
              onTap!();
            },
      child: Text(title),
    );
  }
}
