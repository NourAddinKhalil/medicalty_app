import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrivalTimeWidget extends StatefulWidget {
  const ArrivalTimeWidget({
    super.key,
    required this.title,
    this.titleStyle,
    required this.selected,
    this.showCircleOnEnd = false,
    this.activateOnTab = true,
    this.multiple = true,
    required this.onChange,
    this.trailing,
  });
  final String title;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final bool showCircleOnEnd;
  final bool selected;
  final bool activateOnTab;
  final bool multiple;
  final Function(bool selected) onChange;

  @override
  State<ArrivalTimeWidget> createState() => _ArrivalTimeWidgetState();
}

class _ArrivalTimeWidgetState extends State<ArrivalTimeWidget> {
  var selected = false;

  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   if (selected != widget.selected) {
  //     setState(() {
  //       selected = widget.selected;
  //     });
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  void didUpdateWidget(covariant ArrivalTimeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    selected = widget.selected;
  }

  Widget _buildCircle() {
    return CircleAvatar(
      radius: 15.r,
      backgroundColor: selected ? ColorsConstant.primaryColor : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.showCircleOnEnd ? null : _buildCircle(),
      trailing:
          widget.trailing ?? (!widget.showCircleOnEnd ? null : _buildCircle()),
      title: Text(
        widget.title,
        style: widget.titleStyle ??
            FontSizes.h6?.copyWith(
              fontWeight: FontWeight.w400,
            ),
      ),
      onTap: !widget.activateOnTab
          ? null
          : () {
              setState(() {
                selected = !selected;
              });
              widget.onChange(selected);
            },
    );
  }
}
