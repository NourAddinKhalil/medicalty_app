import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:flutter/material.dart';

class RequestMoneyWidget extends StatelessWidget {
  const RequestMoneyWidget({
    super.key,
    required this.title,
    required this.money,
    this.textColor = Colors.black,
    this.backColor = Colors.white,
    this.spaceBetween = true,
    this.horizantalPadding = 12,
    this.verticalPadding = 16,
    this.titleStyle,
    this.moneyStyle,
    this.moneyWidget,
    this.onMoneyFieldTap,
  });
  final String title;
  final TextStyle? titleStyle;
  final TextStyle? moneyStyle;
  final double money;
  final void Function()? onMoneyFieldTap;
  final Widget? moneyWidget;
  final Color textColor;
  final Color backColor;
  final bool spaceBetween;
  final double verticalPadding;
  final double horizantalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CustomEdgeInsets.symmetric(verticalPadding, horizantalPadding),
      color: backColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: titleStyle ??
                FontSizes.h7?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (spaceBetween) const Expanded(child: SizedBox()),
          if (!spaceBetween) const HorizantalSizedBox(30),
          GestureDetector(
            onTap: onMoneyFieldTap,
            child: moneyWidget ??
                Text(
                  '${money.toStringAsFixed(2)}\$',
                  style: moneyStyle ??
                      FontSizes.h7?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
          ),
        ],
      ),
    );
  }
}
