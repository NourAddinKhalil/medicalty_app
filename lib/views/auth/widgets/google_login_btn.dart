import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class GoogleLoginBtn extends StatelessWidget {
  const GoogleLoginBtn({
    super.key,
    required this.title,
    this.imagePath,
    this.onTab,
    this.isSVG = false,
    this.iconSize = 25,
    this.backgroundColor = const Color(0xffF5F5F5),
    this.textStyle,
  });
  final String title;
  final double iconSize;
  final String? imagePath;
  final void Function()? onTab;
  final bool isSVG;
  final Color backgroundColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: HorizantalSizedBox(double.infinity),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(24.r),
          onTap: onTab,
          hoverColor: backgroundColor,
          child: Container(
            padding: CustomEdgeInsets.all(15),
            width: 330.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: backgroundColor,
              border: const Border(
                bottom: BorderSide(color: Color(0xFF696969)),
                left: BorderSide(color: Color(0xFF696969)),
                right: BorderSide(color: Color(0xFF696969)),
                top: BorderSide(color: Color(0xFF696969)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const HorizantalSizedBox(20),
                if (imagePath != null)
                  !isSVG
                      ? ImageHelpers.getAssetImage(
                          iconSize,
                          iconSize,
                          pic: imagePath,
                        )
                      : ImageHelpers.getSVGAssetImage(
                          iconSize,
                          iconSize,
                          pic: imagePath!,
                        ),
                if (imagePath != null) const HorizantalSizedBox(40),
                Expanded(
                  child: Text(
                    title,
                    style: textStyle ??
                        FontSizes.h8?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorsConstant.primaryColor,
                        ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          child: HorizantalSizedBox(double.infinity),
        ),
      ],
    );
  }
}
