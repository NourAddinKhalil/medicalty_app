import 'package:flutter/material.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';

class CustomFilter extends StatelessWidget {
  const CustomFilter({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });
  final String label;
  final bool isSelected;
  final void Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      onSelected: onSelected,
      selected: isSelected,
      backgroundColor: const Color(0xFF696969).withOpacity(.1),
      selectedColor: ColorsConstant.primaryColor,
      label: Text(
        label,
        style: FontSizes.h9?.copyWith(
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : const Color(0xFF303841),
          // decoration: isSelected ? TextDecoration.underline : null,
          // decorationColor: isSelected ? ColorsConstant.primaryColor : null,
        ),
      ),
      side: BorderSide(
        color: isSelected ? ColorsConstant.primaryColor : Colors.transparent,
      ),
      showCheckmark: false,
    );
  }
}

class ChoiceChipsData {
  final String lable;
  final bool isSelected;
  final void Function()? onPressed;

  ChoiceChipsData({
    required this.lable,
    required this.isSelected,
    this.onPressed,
  });

  ChoiceChipsData copyWith({
    String? lable,
    bool? isSelected,
  }) {
    return ChoiceChipsData(
      lable: lable ?? this.lable,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ChoiceChipsData &&
            runtimeType == other.runtimeType &&
            lable == other.lable &&
            isSelected == other.isSelected &&
            onPressed == other.onPressed;
  }

  @override
  int get hashCode => lable.hashCode ^ isSelected.hashCode ^ onPressed.hashCode;
}
