import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    Key? key,
    required this.enabled,
    this.title = '',
    required this.updateSwitch,
    this.backgroundColor = Colors.white,
    this.titleStyle,
  }) : super(key: key);
  final bool enabled;
  final String title;
  final void Function(int enabled) updateSwitch;
  final Color? backgroundColor;
  final TextStyle? titleStyle;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool enabledButton;
  @override
  void initState() {
    super.initState();
    enabledButton = widget.enabled;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      onChanged: (value) async {
        widget.updateSwitch(value ? 1 : 0);

        setState(() {
          enabledButton = value;
        });
      },
      tileColor: widget.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      title: Text(
        widget.title,
        style: widget.titleStyle,
      ),
      value: enabledButton, //alarm.isEnabled == 1,
      // activeColor: widget.activeColor,
    );
  }
}
