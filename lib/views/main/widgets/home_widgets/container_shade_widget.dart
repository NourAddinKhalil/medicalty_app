import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';

class ContainerShadeWidget extends StatelessWidget {
  const ContainerShadeWidget({
    super.key,
    required this.child,
    this.padding,
    this.width,
  });
  final Widget child;
  final EdgeInsets? padding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.sp,
      margin: CustomEdgeInsets.only(bottom: 5),
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            offset: const Offset(
              0.0,
              1.5,
            ),
            blurRadius: 2.22,
            spreadRadius: 3.2,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: child,
    );
  }
}
