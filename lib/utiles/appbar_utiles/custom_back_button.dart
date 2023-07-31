import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    this.icon = Icons.arrow_back_ios,
    this.iconColor = ColorsConstant.primaryColor,
  }) : super(key: key);
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      iconData: icon,
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Get.back();
      },
      allowOnlineOnly: false,
      allowRegisterOnly: false,
      tooltip: 'Back',
      iconSize: 25,
      iconColor: iconColor,
      // iconColor: blueDesign ? Colors.white : ColorsConstant.accentBlue,
      // style: IconButton.styleFrom(
      //   backgroundColor: Get.theme.primaryColor,
      //   shape: const StadiumBorder(
      //     side: BorderSide(
      //       color: ColorsConstant.accentBlue,
      //     ),
      //   ),
      // ),
      // color: themeProv.isDarkMode ? Colors.white : Colors.black,
    );
  }
}
