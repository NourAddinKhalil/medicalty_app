import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';

class SelectItemButton extends StatelessWidget {
  const SelectItemButton({
    super.key,
    required this.title,
    this.icon = Icons.add_outlined,
    this.subTitle,
    this.subTitleWidget,
    this.isSelected = false,
    required this.onTab,
    this.onClearPressed,
    this.backgroundColor = ColorsConstant.appbarColor,
    this.titleColor = Colors.white,
    this.iconColor = ColorsConstant.green2,
    this.iconOnEnd = false,
    this.showIcon = true,
    this.titleStyle,
    this.subtitleStyle,
  });
  final IconData icon;
  final String title;
  final String? subTitle;
  final Widget? subTitleWidget;
  final bool isSelected;
  final bool showIcon;
  final void Function() onTab;
  final void Function()? onClearPressed;
  final Color backgroundColor;
  final Color titleColor;
  final Color iconColor;
  final bool iconOnEnd;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  Widget buildSubTitle() {
    if (subTitleWidget != null) return subTitleWidget!;
    if (subTitle != null) {
      return SizedBox(
        width: 250.w,
        child: Text(
          subTitle!,
          style: subtitleStyle ??
              FontSizes.h8?.copyWith(
                // fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      );
    }
    return const SizedBox();
  }

  Widget _buildIcon() {
    if (!showIcon) {
      return SizedBox(
        width: isSelected ? 20.w : 28.w,
      );
    }
    return Icon(
      icon,
      color: iconColor,
      size: isSelected ? 20.sp : 28.sp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        padding: CustomEdgeInsets.symmetric(15, 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(1.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!iconOnEnd) _buildIcon(),
            if (!iconOnEnd) const HorizantalSizedBox(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty)
                  Text(
                    title,
                    style: titleStyle ??
                        FontSizes.h7?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                  ),
                if (subTitle != null || subTitleWidget != null)
                  const VerticalSizedBox(8),
                if (subTitle != null || subTitleWidget != null) buildSubTitle(),
              ],
            ),
            const Expanded(
              // flex: 1,
              child: HorizantalSizedBox(double.infinity),
            ),
            if (iconOnEnd) _buildIcon(),
            // if (isSelected)
            //   CustomIconButton(
            //     iconData: Icons.clear_outlined,
            //     tooltip: 'Clear All',
            //     iconColor: ColorsConstant.green2,
            //     iconSize: 24,
            //     onPressed: onClearPressed,
            //   ),
          ],
        ),
      ),
    );
  }
}
