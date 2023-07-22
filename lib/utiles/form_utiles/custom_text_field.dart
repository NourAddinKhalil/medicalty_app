import 'dart:async';

import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:ensure_visible_when_focused/ensure_visible_when_focused.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';
import 'package:medicalty/utiles/custom_loading.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/title_upon_widget.dart';

class CustomTextField<DataType> extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    this.hintText,
    this.innerTextStyle,
    this.saveHandeler,
    this.autoValidate = false,
    this.validator,
    this.allowNullValue = false,
    required this.controller,
    this.otherControlersValues,
    this.isTheLast = false,
    this.typeName = 'type',
    required this.suggestionCallback,
    required this.fieldList,
    this.changeParentUi,
    this.fillColor = const Color(0xFFF5F5F5),
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.showOutlinedStyle = true,
    this.showUnderlinedStyle = false,
    this.showlable = true,
    this.showHint = true,
    this.showlableOutside = false,
    this.readOnly = false,
    this.showIcon = true,
    this.showClearIcon = true,
    this.autofocus = false,
    this.icon = Icons.arrow_forward_ios_outlined,
    this.rotateDegree = 89.5,
    this.suffix,
    required this.onSuggestionSelected,
    required this.itemBuilder,
    this.width,
    this.height,
    this.horizantalPadding = 0,
    this.verticalPadding = 0,
  }) : super(key: key);

  final String title;
  final String? hintText;
  final String typeName;
  final void Function(String? val)? saveHandeler;
  final bool autoValidate;
  final bool allowNullValue;
  final TextEditingController controller;
  final List<TextEditingController>? otherControlersValues;
  final bool isTheLast;
  final FutureOr<Iterable<DataType>> Function(String val) suggestionCallback;
  final String? Function(String? value)? validator;
  final List<DataType>? fieldList;
  final Color? fillColor;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;
  final bool showOutlinedStyle;
  final bool showUnderlinedStyle;
  final bool showlable;
  final bool showHint;
  final bool showlableOutside;
  final bool readOnly;
  final bool showClearIcon;
  final bool autofocus;
  final void Function(int index)? changeParentUi;
  final Widget? suffix;
  final bool showIcon;
  final IconData? icon;
  final double rotateDegree;
  final void Function(DataType selected)? onSuggestionSelected;
  final Widget Function(BuildContext context, DataType suggestion)? itemBuilder;
  final double? width;
  final double? height;
  final TextStyle? innerTextStyle;
  final double horizantalPadding;
  final double verticalPadding;

  @override
  CustomTextFieldState createState() => CustomTextFieldState<DataType>();
}

class CustomTextFieldState<DataType> extends State<CustomTextField<DataType>> {
  final _focusNode = FocusNode();
  var showSuggestionsDown = true;
  var isError = false;
  var _clearBtnFocus = false;

  void changeErrorTheme(bool error) {
    if (error != isError) {
      Future.delayed(
        Duration.zero,
        (() {
          setState(() {
            isError = error;
          });
        }),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(moveCursorAtTheEnd);
  }

  void moveCursorAtTheEnd() {
    widget.controller.selection =
        TextSelection.collapsed(offset: widget.controller.text.length);
    if (!widget.readOnly) {
      setState(() {
        _clearBtnFocus = !_clearBtnFocus;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(moveCursorAtTheEnd);
    _focusNode.dispose();
  }

  Widget _buildTextField() {
    final themeColor = Theme.of(context);
    return EnsureVisibleWhenFocused(
      focusNode: _focusNode,
      child: TypeAheadFormField<DataType>(
        errorBuilder: (_, error) {
          return Padding(
            padding: CustomEdgeInsets.symmetric(8.0, 16),
            child: Text(
              error.toString(),
              style: FontSizes.h8?.copyWith(
                color: ColorsConstant.red,
              ),
            ),
          );
        },
        noItemsFoundBuilder: (context) {
          return SizedBox(
            height: 150.h,
            child: Center(
              child: Text('${widget.typeName} not found'),
            ),
          );
        },
        debounceDuration: const Duration(milliseconds: 500),
        textFieldConfiguration: TextFieldConfiguration(
          focusNode: _focusNode,
          controller: widget.controller,
          onSubmitted: (_) {
            if (widget.isTheLast) {
              FocusManager.instance.primaryFocus?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.nextFocus();
            }
          },
          autofocus: widget.autofocus,
          decoration: InputDecoration(
            fillColor: widget.fillColor,
            filled: widget.fillColor != null,
            //
            enabledBorder: widget.enabledBorder ??
                (widget.showUnderlinedStyle
                    ? const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      )
                    : widget.showOutlinedStyle
                        ? OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                        : null),
            //
            focusedErrorBorder: widget.focusedErrorBorder ??
                (widget.showUnderlinedStyle
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeColor.colorScheme.error, //Colors.black12,
                          width: 1.5,
                        ),
                      )
                    : widget.showOutlinedStyle
                        ? OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeColor
                                  .colorScheme.error, //Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                        : null),
            //
            focusedBorder: widget.focusedBorder ??
                (widget.showUnderlinedStyle
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeColor
                              .primaryColor, //themeColor.focusColor, //Colors.black12,
                          width: 2,
                        ),
                      )
                    : widget.showOutlinedStyle
                        ? OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeColor
                                  .primaryColor, //themeColor.focusColor, //Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                        : null),
            //
            errorBorder: widget.errorBorder ??
                (widget.showUnderlinedStyle
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeColor.colorScheme.error, //Colors.black12,
                          width: 1.5,
                        ),
                      )
                    : widget.showOutlinedStyle
                        ? OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeColor
                                  .colorScheme.error, //Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                        : null),
            //
            border: widget.border ??
                (widget.showUnderlinedStyle
                    ? const UnderlineInputBorder()
                    : widget.showOutlinedStyle
                        ? const OutlineInputBorder()
                        : null),
            //
            labelStyle: FontSizes.h7?.copyWith(
              fontSize: (widget.suffix != null ? FontSizes.h7?.fontSize : null),
              fontWeight: widget.suffix != null ? FontWeight.bold : null,
              color: isError ? themeColor.colorScheme.error : null,
            ),
            hintText: widget.hintText ??
                (widget.showHint ? 'Choose ${widget.typeName}' : null),
            label: widget.title == '' ||
                    widget.title.isEmpty ||
                    !widget.showlable ||
                    widget.showlableOutside
                ? null
                : Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: FontSizes.h7?.copyWith(
                      color: isError ? themeColor.colorScheme.error : null,
                    ),
                  ),
            suffix: widget.suffix,
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!widget.readOnly && widget.showClearIcon)
                  if (_clearBtnFocus)
                    CustomIconButton(
                      iconData: Icons.clear_outlined,
                      tooltip: 'Clear',
                      iconSize: 25.0,
                      allowOnlineOnly: false,
                      allowRegisterOnly: false,
                      makeTheme: true,
                      isError: isError,
                      onPressed: () {
                        if (!widget.readOnly) {
                          widget.controller.text = '';
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      },
                    ),
                const HorizantalSizedBox(9),
                if (widget.showIcon)
                  Transform.rotate(
                    angle: widget.rotateDegree,
                    child: Icon(
                      widget.icon,
                      size: 25.0,
                      color: isError
                          ? themeColor.colorScheme.error
                          : themeColor.primaryColor,
                    ),
                  ),
                const HorizantalSizedBox(15),
              ],
            ),
          ),
          style: widget.innerTextStyle ??
              FontSizes.h8?.copyWith(
                fontWeight: FontWeight.w500,
                color:
                    const Color(0xFFC4C4C4), //themeColor.colorScheme.onSurface,
              ),
          textInputAction:
              widget.isTheLast ? TextInputAction.done : TextInputAction.next,
        ),
        suggestionsCallback: widget.suggestionCallback,
        // widget.isCar ? getCarSuggestions : getCitySuggestions,
        itemBuilder: widget.itemBuilder ??
            (_, dynamic suggestion) {
              final isSelected = suggestion.name == widget.controller.text;
              return Container(
                padding: CustomEdgeInsets.symmetric(7, 0),
                decoration: BoxDecoration(
                  color: isSelected ? ColorsConstant.green2 : null,
                  borderRadius: BorderRadius.circular(isSelected ? 6.r : 12.r),
                ),
                child: Padding(
                  padding: CustomEdgeInsets.horizontal(7),
                  child: Text(
                    suggestion.name,
                    style: FontSizes.h8?.copyWith(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w400,
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                ),
              );
            },
        onSuggestionSelected: widget.onSuggestionSelected ??
            (dynamic suggestion) {
              final name = suggestion!.name;
              widget.controller.text = name;
              if (widget.changeParentUi != null) {
                final index =
                    widget.fieldList?.indexWhere((element) => element == name);
                if (index == null) return;
                widget.changeParentUi!(index);
              }
            },
        // keepSuggestionsOnSuggestionSelected: true,
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          // color: const Color.fromARGB(255, 131, 207, 43),
          borderRadius: BorderRadius.circular(12.r),
        ),
        loadingBuilder: (ctx) {
          return SizedBox(
            height: 250.h,
            child: const CustomLoading(),
          );
        },
        autovalidateMode: widget.autoValidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        validator: (value) {
          String? error;
          if (widget.validator != null) {
            error = widget.validator!(value);
          } else {
            error = Validators.validateListsField<DataType>(
              value,
              widget.otherControlersValues,
              widget.typeName,
              widget.allowNullValue,
              widget.fieldList,
            );
          }
          changeErrorTheme(error != null);

          return error;
        },
        onSaved: widget.saveHandeler,
        direction: showSuggestionsDown ? AxisDirection.down : AxisDirection.up,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width?.w,
      height: widget.height?.h,
      padding: CustomEdgeInsets.symmetric(
        widget.verticalPadding,
        widget.horizantalPadding,
      ),
      child: widget.showlableOutside
          ? TitleUponWidget(
              title: widget.title,
              child: _buildTextField(),
            )
          : _buildTextField(),
    );
  }
}
