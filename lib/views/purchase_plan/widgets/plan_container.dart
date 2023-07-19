import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_elevated_button.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';

class PlanContainer extends StatelessWidget {
  const PlanContainer({
    super.key,
    required this.planTitle,
    required this.planPrice,
    required this.children,
    this.onPressed,
  });
  final String planTitle;
  final String planPrice;
  final List<Widget> children;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CustomEdgeInsets.all(15),
      margin: CustomEdgeInsets.symmetric(15, 20),
      decoration: BoxDecoration(
        color: ColorsConstant.planCntainer,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Text(
                  planTitle,
                  style: FontSizes.h6?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const VerticalSizedBox(3),
                Text(
                  planPrice,
                  style: FontSizes.h7?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSizedBox(8),
          ...children,
          const VerticalSizedBox(20),
          CustomElevatedButton(
            title: 'Choose a plan',
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsConstant.green1,
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
