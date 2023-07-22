import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';

class DepartmentScreenController extends HelpersController {
  final departmentNameTxtField = TextEditingController();
  final descriptionTxtField = TextEditingController();

  @override
  void dispose() {
    departmentNameTxtField.dispose();
    descriptionTxtField.dispose();
    super.dispose();
  }
}
