import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_back_button.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.actions,
    this.titleStyle,
    this.noCustomBackButton = false,
    this.backOnRightSide = false,
    this.leading,
    this.icon = Icons.arrow_back_ios,
    this.iconColor = ColorsConstant.primaryColor,
  });

  final String title;
  final bool backOnRightSide;
  final bool noCustomBackButton;
  final TextStyle? titleStyle;
  final List<Widget>? actions;
  final Widget? leading;
  final IconData icon;
  final Color iconColor;

  List<Widget>? _buildAction() {
    if (backOnRightSide) {
      return [
        CustomBackButton(
          icon: icon,
          iconColor: iconColor,
        ),
        ...?actions,
      ];
    }

    return actions;
  }

  Widget? _buildLeadin() {
    if (backOnRightSide) return const SizedBox();
    if (leading != null) return leading;
    if (!noCustomBackButton) {
      return CustomBackButton(
        icon: icon,
        iconColor: iconColor,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: titleStyle,
      ),
      leading: _buildLeadin(),
      leadingWidth: 55.w,
      actions: _buildAction(),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
