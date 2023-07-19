import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class PersonlyItem extends StatelessWidget {
  const PersonlyItem({
    super.key,
    required this.icon,
    required this.title,
    this.titleColor,
    this.showTrailing = true,
    this.onTab,
  });

  final String icon;
  final String title;
  final Color? titleColor;
  final bool showTrailing;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: CustomEdgeInsets.all(20),
      leading: Container(
        padding: CustomEdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: const Color(0xFFF3F5F7),
        ),
        child: ImageHelpers.getSVGAssetImage(
          25,
          25,
          pic: icon,
        ),
      ),
      title: Text(
        title,
        style: FontSizes.h7?.copyWith(
          fontWeight: FontWeight.w600,
          color: titleColor,
        ),
      ),
      trailing: !showTrailing
          ? null
          : Icon(
              Icons.arrow_forward_ios,
              size: 20.sp,
              color: ColorsConstant.accentBlue,
            ),
      onTap: onTab,
    );
  }
}
