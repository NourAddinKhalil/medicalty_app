import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:ensure_visible_when_focused/ensure_visible_when_focused.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/title_upon_widget.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final int? maxLength;
  final String label;
  final String? helperText;
  final String? hintText;
  final void Function(String? value)? onSaved;
  final void Function(String value)? onChange;
  final String? Function(String? value)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final int? minLines;
  final int? maxLines;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  // final IconData icon;
  final bool readOnly;
  final bool imprtantBorder;
  final double? borderThickness;
  final bool autoFocus;
  final TextAlignVertical? textAlignVertical;
  final Widget? suffix;
  final Widget? leading;
  final AutovalidateMode autovalidateMode;
  final void Function()? onTap;
  final bool canDeleteText;
  final double iconSize;
  final IconData? icon;
  final double? textSize;
  final bool showClearIcon;
  final bool showSuffix;
  final bool obscureText;
  final bool showObscureText;
  final Color? fillColor;
  final Color borderColor;
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
  final bool showCounter;
  final List<TextInputFormatter>? inputFormatters;
  final double? width;
  final double? height;
  final double horizantalPadding;
  final double verticalPadding;
  final TextStyle? innerTextStyle;
  const CustomTextFormField({
    Key? key,
    required this.label,
    this.hintText,
    required this.controller,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.minLines,
    this.readOnly = false,
    this.imprtantBorder = false,
    this.borderThickness,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.suffix,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    required this.validator,
    required this.onSaved,
    this.onChange,
    this.showSuffix = true,
    this.icon,
    this.iconSize = 25.0,
    this.textSize,
    this.onTap,
    this.canDeleteText = true,
    this.showClearIcon = true,
    this.obscureText = false,
    this.showObscureText = true,
    this.fillColor = const Color(0xFFF5F5F5),
    this.borderColor = const Color(0xFF696969),
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.showOutlinedStyle = true,
    this.showUnderlinedStyle = false,
    this.showlable = true,
    this.showHint = false,
    this.showCounter = true,
    this.showlableOutside = false,
    this.leading,
    this.inputFormatters,
    this.helperText,
    this.width,
    this.height,
    this.horizantalPadding = 0,
    this.verticalPadding = 0,
    this.innerTextStyle,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _focusNode = FocusNode();
  var isError = false;
  late bool _obscureText;
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
    _obscureText = widget.obscureText;
    _focusNode.addListener(moveCursorAtTheEnd);
  }

  void moveCursorAtTheEnd() {
    widget.controller?.selection =
        TextSelection.collapsed(offset: widget.controller?.text.length ?? 0);
    // var textNotEmpty = widget.controller?.text.trim().isNotEmpty ?? true;
    if (widget.showClearIcon && widget.canDeleteText) {
      setState(() {
        _clearBtnFocus = !_clearBtnFocus;
      });
    }
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
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
      child: TextFormField(
        onTap: widget.onTap,
        scrollPadding: const EdgeInsets.all(0),
        focusNode: _focusNode,
        minLines: widget.obscureText ? 1 : widget.minLines,
        maxLines: widget.obscureText ? 1 : widget.maxLines,
        maxLength: widget.maxLength,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        readOnly: widget.readOnly,
        textDirection: widget.textDirection,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        controller: widget.controller,
        autofocus: widget.autoFocus,
        autovalidateMode: widget.autovalidateMode,
        obscureText: _obscureText,
        inputFormatters: widget.inputFormatters ??
            (widget.textInputType == TextInputType.phone
                ? [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[+0-9]'),
                    ),
                  ]
                : widget.textInputType == TextInputType.number
                    ? [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9.]'),
                        ),
                      ]
                    : null),
        decoration: InputDecoration(
          hintText: widget.hintText ?? (widget.showHint ? widget.label : null),
          counterText: !widget.showCounter ? '' : null,
          fillColor: widget.fillColor,
          filled: widget.fillColor != null,

          helperText: widget.helperText,
          helperStyle: FontSizes.h9?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
          prefixIcon: widget.leading,
          prefixIconColor: isError
              ? themeColor.colorScheme.error
              : Colors.black45, //themeColor.iconTheme.color,
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
                          borderSide: BorderSide(
                            color: widget.borderColor,
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
                            color:
                                themeColor.colorScheme.error, //Colors.black12,
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
                            color:
                                themeColor.colorScheme.error, //Colors.black12,
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
            fontSize: widget.textSize?.sp ??
                (widget.suffix != null ? FontSizes.h7?.fontSize : null),
            fontWeight: widget.suffix != null ? FontWeight.bold : null,
            color: isError ? themeColor.colorScheme.error : null,
          ),
          label: widget.label == '' ||
                  widget.label.isEmpty ||
                  !widget.showlable ||
                  widget.showlableOutside
              ? null
              : Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: FontSizes.h7?.copyWith(
                    fontSize: widget.textSize?.sp ??
                        (widget.suffix != null ? FontSizes.h7?.fontSize : null),
                    fontWeight: widget.suffix != null ? FontWeight.bold : null,
                    color: isError ? themeColor.colorScheme.error : null,
                  ),
                  // TextStyle(
                  //   fontSize: widget.suffix != null ? 28.0.sp : 24.0.sp,
                  //   fontWeight: widget.suffix != null ? FontWeight.bold : null,
                  //   color: isError
                  //       ? themeColor.colorScheme.error
                  //       : themeColor.iconTheme.color,
                  // ),
                ),
          suffix: widget.suffix,

          suffixIcon: !widget.showSuffix
              ? null
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.showClearIcon)
                      if (_clearBtnFocus)
                        CustomIconButton(
                          iconData: Icons.clear_outlined,
                          tooltip: 'Clear',
                          iconSize: 25.0,
                          allowOnlineOnly: false,
                          allowRegisterOnly: false,
                          makeTheme: true,
                          iconColor: Colors.black45,
                          isError: isError,
                          onPressed: () {
                            if (widget.canDeleteText) {
                              widget.controller?.text = '';
                              if (widget.onChange != null) {
                                widget.onChange!('');
                              }
                              FocusManager.instance.primaryFocus?.unfocus();
                              // setState(() {
                              //   if (_clearBtnFocus == true &&
                              //       widget.controller.text.isEmpty) {
                              //     _clearBtnFocus = false;
                              //   }
                              // });
                            }
                          },
                        ),
                    if (widget.icon != null)
                      Padding(
                        padding: CustomEdgeInsets.only(right: 8.0),
                        child: Icon(
                          widget.icon,
                          size: widget.iconSize.sp,
                          color: !isError
                              ? themeColor.iconTheme.color
                              : themeColor.colorScheme.error,
                        ),
                      ),
                    if (widget.obscureText && widget.showObscureText)
                      CustomIconButton(
                        iconData: _obscureText
                            ? FontAwesomeIcons.solidEyeSlash
                            : FontAwesomeIcons.solidEye,
                        tooltip: _obscureText ? 'Show' : 'Hide',
                        iconSize: 20.0,
                        // iconColor: Colors.black45,
                        allowOnlineOnly: false,
                        allowRegisterOnly: false,
                        makeTheme: true,
                        isError: isError,
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    const HorizantalSizedBox(2),
                  ],
                ),
        ),
        style: widget.innerTextStyle ??
            FontSizes.h8?.copyWith(
              fontSize: widget.imprtantBorder ? FontSizes.h6?.fontSize : null,
              fontWeight:
                  widget.imprtantBorder ? FontWeight.bold : FontWeight.w400,
              color:
                  const Color(0xFFC4C4C4), //themeColor.colorScheme.onSurface,
            ),
        // TextStyle(
        //   color: themeColor.colorScheme.onSurface,
        //   fontSize: widget.imprtantBorder
        //       ? 32.0.sp
        //       : widget.suffix != null
        //           ? 32.0.sp
        //           : 28.0.sp,
        //   fontWeight: widget.imprtantBorder ? FontWeight.bold : null,
        // ),
        onFieldSubmitted: (_) {
          final done = FocusManager.instance.primaryFocus?.nextFocus();
          if (!(done ?? false)) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        onChanged: (value) {
          if (widget.onChange != null) widget.onChange!(value);
          if (widget.maxLength != null && value.length == widget.maxLength) {
            FocusManager.instance.primaryFocus?.nextFocus();
          }
        },
        // onTapOutside: (event) {
        //   FocusManager.instance.primaryFocus?.unfocus();
        // },
        validator: (value) {
          if (widget.validator != null) {
            final error = widget.validator!(value);
            changeErrorTheme(error != null);
            return error;
          }
          return null;
        },
        onSaved: widget.onSaved,
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
              title: widget.label,
              child: _buildTextField(),
            )
          : _buildTextField(),
    );
  }
}
