// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../constants/themes/colors_constant.dart';

class DropDownButton extends StatelessWidget {
  DropDownButton({
    super.key,
    required this.list,
    required this.value,
    required this.hint,
  });

  final List list;
  final String hint;
  String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          fillColor: ColorsConstant.white,
          hintText: hint, //"Product Type",
          hintStyle: const TextStyle(
              color: ColorsConstant.grey,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat'),
          filled: true,
          border: UnderlineInputBorder(
              borderSide: const BorderSide(color: ColorsConstant.blackBlue),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: ColorsConstant.blackBlue),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: ColorsConstant.blackBlue),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10))),
      items: list.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      value: value,
      onChanged: (value) {
        this.value = value!;
      },
    );
  }
}
