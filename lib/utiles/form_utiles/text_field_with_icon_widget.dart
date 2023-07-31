import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWithIconWidget extends StatelessWidget {
  const TextFieldWithIconWidget({
    super.key,
    required this.child,
    required this.icon,
    this.iconSize = 20,
    this.noIcon = false,
  });
  final Widget child;
  final String icon;
  final double iconSize;
  final bool noIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 30.w,
          child: noIcon
              ? null
              : ImageHelpers.getSVGAssetImage(
                  iconSize,
                  iconSize,
                  pic: icon,
                ),
        ),
        const HorizantalSizedBox(20),
        Expanded(child: child),
      ],
    );
  }
}
