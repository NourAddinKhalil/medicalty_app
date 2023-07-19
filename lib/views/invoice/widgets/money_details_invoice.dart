import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_text_button.dart';
import 'package:flutter/material.dart';

class MoneyDetailsInvoice extends StatelessWidget {
  const MoneyDetailsInvoice({
    super.key,
    required this.title,
    required this.onPressed,
    this.amount,
    this.color = Colors.black,
    this.subTitle,
    this.showAddText = true,
    this.fontSize,
    this.isFixed = true,
  });
  final String title;
  final double? amount;
  final Widget? subTitle;
  final Color color;
  final bool showAddText;
  final double? fontSize;
  final Function() onPressed;
  final bool isFixed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: FontSizes.h8?.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        subTitle ??
            CustomTextButton(
              allowOnlineOnly: false,
              allowRegisterOnly: false,
              title: ((amount ?? 0.0) == 0.00 && showAddText)
                  ? 'Add'
                  : '${amount!.toStringAsFixed(2)} ${isFixed ? '\$' : '%'}',
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: FontSizes.h8?.copyWith(
                  fontSize: fontSize,
                  fontWeight:
                      fontSize != null ? FontWeight.bold : FontWeight.w400,
                ),
              ),
              onPressed: onPressed,
            )
      ],
    );
  }
}
