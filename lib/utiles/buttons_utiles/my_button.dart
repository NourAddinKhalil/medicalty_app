// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final Color color;
  final Widget widget;
  final Function() function;
  final double? Circular;

  const MyButton({
    super.key,
    required this.color,
    required this.widget,
    required this.function,
    this.Circular = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Circular!)),
            backgroundColor: color,
          ),
          onPressed: function,
          child: widget),
    );
  }
}
