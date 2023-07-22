import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';

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

  Future<void> save() async {}

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
