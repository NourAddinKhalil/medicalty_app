import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceBottomHeader extends StatelessWidget {
  const InvoiceBottomHeader({
    super.key,
    required this.title,
    required this.child,
    this.onBackPressed,
    this.headerStyle,
  });
  final String title;
  final Widget child;
  final TextStyle? headerStyle;
  final Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: CustomEdgeInsets.symmetric(10, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: headerStyle ??
                      FontSizes.h6?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                CustomIconButton(
                  iconData: Icons.clear,
                  allowOnlineOnly: false,
                  allowRegisterOnly: false,
                  iconSize: 20,
                  iconColor: Colors.black,
                  tooltip: 'close',
                  onPressed: onBackPressed ??
                      () {
                        Get.back();
                      },
                ),
              ],
            ),
          ),
          const VerticalSizedBox(20),
          child,
        ],
      ),
    );
  }
}
