import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/constants/themes/theme_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangeAppbarColor extends StatelessWidget {
  const ChangeAppbarColor({
    super.key,
    this.backgroundColor = ColorsConstant.appbarColor,
    this.isDark = true,
    required this.child,
  });
  final Color backgroundColor;
  final bool isDark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: ThemeHelpers.systemUiOverlayStyle(
        backgroundColor,
        isDark,
      ),
      child: child,
    );
  }
}
