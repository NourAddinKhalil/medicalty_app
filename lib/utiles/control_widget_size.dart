import 'package:flutter/material.dart';

class ControlWidgetSize extends StatelessWidget {
  const ControlWidgetSize({
    super.key,
    required this.child,
    this.childFlex = 3,
    this.remaningFlex = 1,
  });
  final Widget child;
  final int childFlex;
  final int remaningFlex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: childFlex,
          child: child,
        ),
        Flexible(
          flex: remaningFlex,
          child: const SizedBox(),
        ),
      ],
    );
  }
}
