// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../constants/themes/colors_constant.dart';

class LinearGradientContainer extends StatelessWidget {
  final Alignment beginAlignment;
  const LinearGradientContainer({
    Key? key,
    required this.beginAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
          ),
          gradient: LinearGradient(
              transform: const GradientRotation(20),
              begin: beginAlignment,
              tileMode: TileMode.clamp,
              end: Alignment.bottomLeft,
              colors: [
                ColorsConstant.blackBlue.withOpacity(.4),
                ColorsConstant.white
              ])),
    );
  }
}
