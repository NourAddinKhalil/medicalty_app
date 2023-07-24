import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/helpers/enums.dart';
import 'package:medicalty/models/department_model.dart';
import 'package:medicalty/models/employee_model.dart';

class EmployeeScreenController extends HelpersController {
  final belongsToTxtField = TextEditingController();
  final birthDateTxtField = TextEditingController();
  final workingTimeTxtField = TextEditingController();
  final hourlySalaryTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final totalSalaryTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final nameTxtField = TextEditingController();
  final usernameTxtField = TextEditingController();

  var model = EmployeeModel.defaultModel;

  String _image = '';
  String get image => _image;
  void onImageChoosen(String? image) {
    _image = image ?? '';
    model = model.copyWith(
      image: _image,
    );
    update(['image']);
  }

  void onDepartmentSelected(DepartmentModel selected) {
    belongsToTxtField.text = selected.name;
    model = model.copyWith(departmentId: selected.id);
    update(['department']);
  }

  void onWorkingTimesSelected(WorkingTimesEnum selected) {
    workingTimeTxtField.text = selected.name;
    model = model.copyWith(workingTime: selected.name);
    update(['working_times']);
  }

  @override
  void dispose() {
    birthDateTxtField.dispose();
    workingTimeTxtField.dispose();
    belongsToTxtField.dispose();
    hourlySalaryTxtField.dispose();
    totalSalaryTxtField.dispose();
    nameTxtField.dispose();
    usernameTxtField.dispose();
    super.dispose();
  }
}
