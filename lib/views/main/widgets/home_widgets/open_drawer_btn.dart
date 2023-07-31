import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';

class OpenDrawerBtn extends StatelessWidget {
  const OpenDrawerBtn({
    super.key,
    this.color = Colors.white,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      iconData: Icons.settings_outlined,
      tooltip: 'Settings',
      iconColor: color,
      allowOnlineOnly: false,
      allowRegisterOnly: false,
      iconSize: 30,
      onPressed: () {
        Scaffold.of(Get.find()).openEndDrawer();
        // globalKey.currentState?.openEndDrawer();
      },
    );
  }
}
