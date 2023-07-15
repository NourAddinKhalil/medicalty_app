import 'package:dropdown_search/dropdown_search.dart';
import 'package:ensure_visible_when_focused/ensure_visible_when_focused.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/title_upon_widget.dart';

class CustomDropDownBtn<DataType> extends StatefulWidget {
  const CustomDropDownBtn({
    Key? key,
    required this.items,
    required this.onChange,
    this.checkLast = true,
    this.autofocus = false,
    required this.label,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.onSaved,
    this.validator,
    this.fillColor,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.showOutlinedStyle = true,
    this.showUnderlinedStyle = false,
    this.showlable = true,
    this.showHint = false,
    this.showlableOutside = false,
    this.helperText,
    required this.controller,
    this.width,
    this.height,
    this.horizantalPadding = 0,
    this.verticalPadding = 0,
  }) : super(key: key);
  final List<DataType> items;
  final TextEditingController controller;
  final void Function(DataType?) onChange;
  final bool checkLast;
  final bool autofocus;
  final String label;
  final String? helperText;
  final AutovalidateMode autovalidateMode;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
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
  final void Function(DataType?)? onSaved;
  final String? Function(DataType?)? validator;
  final double? width;
  final double? height;
  final double horizantalPadding;
  final double verticalPadding;

  @override
  State<CustomDropDownBtn<DataType>> createState() =>
      _CustomDropDownBtnState<DataType>();
}

class _CustomDropDownBtnState<DataType>
    extends State<CustomDropDownBtn<DataType>> {
  late DataType initVal;
  var isError = false;
  final _focusNode = FocusNode();

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
    initVal = widget.items.last;

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // List<DropdownMenuItem<String>>? _buildItems() {
  //   return widget.items.map(
  //     (item) {
  //       return DropdownMenuItem<String>(
  //         value: '$item',
  //         child: Text('$item'),
  //       );
  //     },
  //   ).toList();
  // }

  Widget _buildDropdown() {
    final themeColor = Get.theme; //Theme.of(context);
    return EnsureVisibleWhenFocused(
      focusNode: _focusNode,
      child: DropdownSearch<DataType>(
        autoValidateMode: widget.autovalidateMode,
        validator: (value) {
          if (widget.validator != null) {
            final error = widget.validator!(value);
            changeErrorTheme(error != null);
            return error;
          }
          return null;
        },
        onSaved: widget.onSaved,
        items: widget.items,
        onChanged: (value) {
          var val = value;

          if (widget.checkLast) {
            val = value != widget.items.last ? value : null;
          }

          widget.onChange(val);

          setState(() {
            initVal = value as DataType;
          });
        },
        clearButtonProps: ClearButtonProps(
          iconSize: 25.sp,
          color: themeColor.iconTheme.color,
          tooltip: 'Clear',
          isVisible: true,
        ),
        dropdownButtonProps: DropdownButtonProps(
          alignment: AlignmentDirectional.bottomCenter,
          autofocus: widget.autofocus,
          focusNode: _focusNode,
          color: themeColor.iconTheme.color,
          iconSize: 25.sp,
          icon: Transform.rotate(
            angle: 89.5,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20.sp,
              color: themeColor.iconTheme.color,
            ),
          ),
          selectedIcon: Transform.rotate(
            angle: -89.5,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20.sp,
              color: themeColor.iconTheme.color,
            ),
          ),
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          dropdownSearchDecoration: InputDecoration(
            hintText: widget.showHint ? widget.label : null,
            fillColor: widget.fillColor,
            filled: widget.fillColor != null,
            helperText: widget.helperText,
            //
            enabledBorder: widget.enabledBorder ??
                (widget.showUnderlinedStyle
                    ? const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
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
            label: widget.label == '' ||
                    widget.label.isEmpty ||
                    !widget.showlable ||
                    widget.showlableOutside
                ? null
                : Text(
                    widget.label,
                    textAlign: TextAlign.center,
                    style: FontSizes.h8?.copyWith(
                      color: isError ? themeColor.colorScheme.error : null,
                    ),
                  ),
          ),
        ),
        // dropdownBuilder: (context, selectedItem) {
        //   return Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(24.r),
        //       color: Colors.black,
        //     ),
        //     child: Text(selectedItem.toString()),
        //   );
        // },
        popupProps: PopupProps.menu(
          showSelectedItems: true,
          fit: FlexFit.loose,
          // showSearchBox: true,
          // searchFieldProps: TextFieldProps(
          //   controller: widget.controller,
          //   focusNode: _focusNode,
          //   autofocus: widget.autofocus,
          // ),
          containerBuilder: (context, popupWidget) {
            return Container(
              margin: CustomEdgeInsets.only(
                top: 10,
                // left: 5,
                // right: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: const Color(0xffe7f6ff),
              ),
              child: popupWidget,
            );
          },
          menuProps: MenuProps(
            backgroundColor: const Color(0xffe7f6ff),
            borderRadius: BorderRadius.circular(12.r),
          ),
          itemBuilder: (context, item, isSelected) {
            return Container(
              padding: CustomEdgeInsets.symmetric(7, 0),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xff27AEFF) : null,
                borderRadius: BorderRadius.circular(isSelected ? 6.r : 12.r),
              ),
              child: Padding(
                padding: CustomEdgeInsets.horizontal(7),
                child: Text(
                  item.toString(),
                  style: FontSizes.h9?.copyWith(
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.white : null,
                  ),
                ),
              ),
            );
          },
        ),
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
              child: _buildDropdown(),
            )
          : _buildDropdown(),
    );

    // DropdownButtonFormField<String>(
    //   items: [...?_buildItems()],
    //   // underline: null,
    //   decoration: InputDecoration(
    //     hintText: widget.label,
    //     fillColor: const Color.fromARGB(76, 194, 207, 224),
    //     filled: true,
    //     enabledBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(
    //         width: 1.0,
    //         color: Colors.transparent,
    //       ),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     focusedErrorBorder: OutlineInputBorder(
    //       borderSide: BorderSide(
    //         width: 1.0,
    //         color: themeColor.colorScheme.error, //Colors.black12,
    //       ),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(
    //         width: 1.0,
    //         color:
    //             Colors.transparent, //themeColor.focusColor, //Colors.black12,
    //       ),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //   ),
    //   icon: Transform.rotate(
    //     angle: 89.5,
    //     child: Icon(
    //       Icons.arrow_forward_ios,
    //       size: 30.sp,
    //       color: themeColor.iconTheme.color,
    //     ),
    //   ),
    //   iconSize: 30.sp,
    //   alignment: AlignmentDirectional.bottomCenter,
    //   onChanged: (value) {
    //     var val = value;
    //     if (widget.checkLast) {
    //       val = value != widget.items.last ? value : '';
    //     }
    //     widget.onChange(val);
    //     setState(() {
    //       initVal = value!;
    //     });
    //   },
    //   // value: initVal,
    //   autovalidateMode: widget.autovalidateMode,
    //   onSaved: widget.onSaved,
    //   validator: widget.validator,
    //   autofocus: widget.autofocus,
    // );
  }
}
