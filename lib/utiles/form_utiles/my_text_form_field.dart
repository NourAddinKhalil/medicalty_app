// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../constants/themes/colors_constant.dart';

// import '../../constants/fonts.dart';

class MyTextFormField extends StatelessWidget {
  final Function validator;
  final String hintText;
  final void Function()? ontap;
  Color fillColor;
  Color textColor;
  Color focusedBorderColor;
  Color enabledBorderColor;
  TextEditingController? controller;
  bool obsecure;
  Widget? prefixIcon;
  bool multiLines;
  TextInputType KeyboardType;
  String? fontFamily;

  MyTextFormField({
    super.key,
    required this.validator,
    required this.hintText,
    this.prefixIcon,
    this.obsecure = false,
    this.multiLines = false,
    this.fillColor = ColorsConstant.white,
    this.textColor = ColorsConstant.dark,
    this.focusedBorderColor = ColorsConstant.dark,
    this.enabledBorderColor = ColorsConstant.dark,
    this.controller,
    this.KeyboardType = TextInputType.text,
    this.fontFamily = "Montserrat",
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      maxLines: multiLines ? 8 : 1,
      obscureText: obsecure,
      controller: controller,
      cursorColor: ColorsConstant.dark,
      style: TextStyle(color: textColor, fontFamily: fontFamily),
      keyboardType: KeyboardType,
      validator: (value) => validator(value),
      decoration: InputDecoration(
          prefixIcon: multiLines
              ? Container(
                  height: 80,
                  width: 10,
                  alignment: Alignment.topCenter,
                  child: prefixIcon)
              : prefixIcon,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat'),
          filled: true,
          border: UnderlineInputBorder(
              borderSide: const BorderSide(color: ColorsConstant.dark),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: enabledBorderColor),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: focusedBorderColor),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
