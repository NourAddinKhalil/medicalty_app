import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';

class CustomSuggestionHelpers {
  /// primative means that it will show any string, double,....etc.
  /// and all primative types
  /// if data type is class name you should make your own
  /// builder
  static Widget itemPrimativTypesBuilder<DataType>(
    BuildContext context,
    DataType suggestion,
    DataType curValue,
  ) {
    final isSelected = suggestion.toString() == curValue;
    return _buildResultsText(isSelected, suggestion.toString());
  }

  /// this if you have multi selection
  /// you should provide the list that
  /// your item saved in
  /// builder
  static Widget itemListBuilder(
    BuildContext context,
    String suggestion,
    List<String> curValues,
  ) {
    final isSelected = curValues.contains(suggestion);
    return _buildResultsText(isSelected, suggestion.toString());
  }

  static Widget _buildResultsText(bool isSelected, String suggestion) {
    return Container(
      padding: CustomEdgeInsets.symmetric(7, 0),
      decoration: BoxDecoration(
        color: isSelected ? ColorsConstant.green2 : null,
        borderRadius: BorderRadius.circular(isSelected ? 6.r : 12.r),
      ),
      child: Padding(
        padding: CustomEdgeInsets.horizontal(7),
        child: Text(
          suggestion,
          style: FontSizes.h8?.copyWith(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
            color: isSelected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
