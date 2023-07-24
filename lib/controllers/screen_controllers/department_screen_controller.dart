import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/models/department_model.dart';

class DepartmentScreenController extends HelpersController {
  final departmentNameTxtField = TextEditingController();
  final descriptionTxtField = TextEditingController();

  var model = DepartmentModel.defaultModel;

  String _image = '';
  String get image => _image;
  void onImageChoosen(String? image) {
    _image = image ?? '';
    model = model.copyWith(
      image: _image,
    );
    update(['image']);
  }

  @override
  void dispose() {
    departmentNameTxtField.dispose();
    descriptionTxtField.dispose();
    super.dispose();
  }
}
