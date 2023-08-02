import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';

class CustomShowField extends StatelessWidget {
  const CustomShowField({
    super.key,
    required this.title,
    this.icon,
    this.fillColor = const Color(0xFFF5F5F5),
    this.titleColor,
    this.isPassword = false,
    this.iconImage,
    this.minHeight = 50,
    this.horizantalMargin = 20,
    this.alignment,
  });
  final String title;
  final bool isPassword;
  final double horizantalMargin;
  final double minHeight;
  final Color fillColor;
  final Color? titleColor;
  final IconData? icon;
  final String? iconImage;
  final Alignment? alignment;

  String _buildTitleString() {
    if (!isPassword) return title;

    final len = title.length;

    final newTitle = List.generate(
      len,
      (index) => '.',
    ).join();

    return newTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: CustomEdgeInsets.horizontal(horizantalMargin),
      padding: CustomEdgeInsets.symmetric(12, 12),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      constraints: BoxConstraints(
        minHeight: minHeight.h,
      ),
      alignment: alignment,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _buildTitleString(),
            style: FontSizes.h8?.copyWith(
              fontSize: isPassword ? FontSizes.h6?.fontSize : null,
              color: titleColor,
            ),
          ),
          if (icon != null)
            Icon(
              icon,
              size: 22.sp,
            ),
          if (iconImage != null)
            CircleSqureImage(
              pic: iconImage!,
              width: 44,
              height: 44,
            ),
        ],
      ),
    );
  }
}
