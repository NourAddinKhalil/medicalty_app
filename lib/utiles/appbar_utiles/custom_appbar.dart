import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/appbar_utiles/change_appbar_color.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.actions,
    this.titleStyle,
    this.noBackButton = false,
    this.backOnRightSide = false,
    // this.backButtonBlueDesign = true,
    // this.noCustomBackButton = true,
    this.leading,
    this.backgroundColor = ColorsConstant.appbarColor,
    this.titleColor = Colors.white,
    this.isDark = true,
  });

  final String title;
  final bool noBackButton;
  final bool backOnRightSide;
  // final bool backButtonBlueDesign;
  // final bool noCustomBackButton;
  final TextStyle? titleStyle;
  final List<Widget>? actions;
  final Widget? leading;
  final Color backgroundColor;
  final Color titleColor;
  final bool isDark;

  _buildBackButton() {
    return CustomIconButton(
      iconData:
          backOnRightSide ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
      iconColor: Colors.white,
      iconSize: 24,
      tooltip: 'back',
      allowOnlineOnly: false,
      allowRegisterOnly: false,
      onPressed: () {
        Get.back();
      },
    );
  }

  Widget _buildLeading() {
    if (leading != null) {
      return leading!;
    }
    if (backOnRightSide) return const HorizantalSizedBox(24);
    return noBackButton ? const HorizantalSizedBox(24) : _buildBackButton();
    // noCustomBackButton
    //     ? const HorizantalSizedBox(4)
    //     : CustomBackButton(
    //         blueDesign: backButtonBlueDesign,
    //       );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeAppbarColor(
      backgroundColor: backgroundColor,
      isDark: isDark,
      child: Container(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        height: 120.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.r),
            bottomRight: Radius.circular(12.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildLeading(),
            const Expanded(child: SizedBox()),
            Text(
              title,
              style: FontSizes.h6?.copyWith(
                fontWeight: FontWeight.w700,
                color: titleColor,
              ),
            ),
            const Expanded(child: SizedBox()),
            if (backOnRightSide) _buildBackButton(),
            if (actions == null && !backOnRightSide)
              const HorizantalSizedBox(24),
            if (actions != null && !backOnRightSide)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [...?actions],
              )
          ],
        ),
      ),
    );
    // AppBar(
    //   title: Text(
    //     title,
    //     style: titleStyle,
    //   ),
    //   leading: leading ??
    //       (noCustomBackButton
    //           ? null
    //           : CustomBackButton(
    //               blueDesign: backButtonBlueDesign,
    //             )),
    //   leadingWidth: 55.w,
    //   actions: actions,
    // );
  }

  @override
  Size get preferredSize => Size(double.infinity, 100.h);
}
