import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    Key? key,
    required this.checkedHandeler,
    required this.isChecked,
    required this.title,
    this.subtitle,
    this.style,
  }) : super(key: key);

  final void Function(bool isChecked) checkedHandeler;
  final bool isChecked;
  final String title;
  final String? subtitle;
  final TextStyle? style;

  @override
  CustomCheckBoxState createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  var checked = false;

  @override
  void didUpdateWidget(covariant CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    checked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CheckboxListTile(
      title: Text(
        widget.title,
        style: widget.style,
      ),
      value: checked,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            checked = value;
            widget.checkedHandeler(checked);
          });
        }
      },
      subtitle: widget.subtitle == null
          ? null
          : Text(
              widget.subtitle!,
              textAlign: TextAlign.center,
            ),
      activeColor: theme.appBarTheme.actionsIconTheme?.color,
    );
  }
}
