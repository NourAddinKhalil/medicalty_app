import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    this.blueDesign = true,
  }) : super(key: key);
  final bool blueDesign;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: CustomEdgeInsets.all(10
          // left: 15,
          // right: 5,
          // bottom: 10,
          // top: 10,
          ),
      padding: CustomEdgeInsets.only(left: 5),
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: blueDesign ? ColorsConstant.accentBlue : Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(
              0.0,
              1.0,
            ),
            blurRadius: 6,
          ),
        ],
      ),
      child: CustomIconButton(
        iconData: Icons.arrow_back_ios,
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          Get.back();
        },
        allowOnlineOnly: false,
        allowRegisterOnly: false,
        tooltip: 'Back',
        iconSize: 20,
        iconColor: blueDesign ? Colors.white : ColorsConstant.accentBlue,
        // style: IconButton.styleFrom(
        //   backgroundColor: Get.theme.primaryColor,
        //   shape: const StadiumBorder(
        //     side: BorderSide(
        //       color: ColorsConstant.accentBlue,
        //     ),
        //   ),
        // ),
        // color: themeProv.isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }
}
