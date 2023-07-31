import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/api_controllers/connection_controller.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/show_messages.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class DrawerButtons extends StatelessWidget {
  const DrawerButtons({
    Key? key,
    this.iconData,
    this.imagePath,
    required this.title,
    required this.onTab,
    this.allowOnlineOnly = true,
    this.iconColor,
    this.textColor,
  }) : super(key: key);
  final IconData? iconData;
  final String? imagePath;
  final String title;
  final void Function() onTab;
  final bool allowOnlineOnly;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<ConnectionController>(
      builder: (connController) {
        return ListTile(
          leading: iconData != null
              ? Icon(
                  iconData,
                  color: iconColor ?? theme.iconTheme.color,
                )
              : ImageHelpers.getSVGAssetImage(
                  25,
                  25,
                  pic: imagePath!,
                  color: iconColor,
                ),
          title: Text(
            title,
            style: FontSizes.h7?.copyWith(
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          onTap: allowOnlineOnly && connController.isOnline
              ? onTab
              : () {
                  if (allowOnlineOnly) {
                    if (!connController.isOnline) {
                      ShowAnyMessages.showSnackBar(noCONNECTIONMSG);
                      return;
                    }
                  }
                  onTab();
                },
        );
      },
    );
  }
}
