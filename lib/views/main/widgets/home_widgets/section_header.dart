import 'package:flutter/material.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_text_button.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final String buttonTitle;
  final bool showButton;
  final TextStyle? titleStyle;

  const SectionHeader({
    super.key,
    required this.title,
    this.titleStyle,
    this.onTap,
    this.buttonTitle = 'See All',
    this.showButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: titleStyle ?? FontSizes.h7,
        ),
        const Expanded(child: SizedBox()),
        if (showButton)
          CustomTextButton(
            title: buttonTitle,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: Colors.black,
              textStyle: FontSizes.h9,
            ),
            onPressed: onTap,
          ),
      ],
    );
  }
}
