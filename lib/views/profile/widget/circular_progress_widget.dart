// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../constants/themes/colors_constant.dart';

class MyCircularProgress extends StatefulWidget {
  final double value;
  final double height;
  final double width;
  final Widget widget;
  final Color valueColor;

  const MyCircularProgress({
    Key? key,
    required this.value,
    required this.height,
    required this.width,
    required this.widget,
    required this.valueColor,
  }) : super(key: key);

  @override
  State<MyCircularProgress> createState() => _MyCircularProgressState();
}

class _MyCircularProgressState extends State<MyCircularProgress> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: CircularProgressIndicator(
              value: widget.value,
              backgroundColor: ColorsConstant.blackGrey,
              color: widget.valueColor),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: 0,
          child: widget.widget,
        ),
      ],
    );
  }
}
