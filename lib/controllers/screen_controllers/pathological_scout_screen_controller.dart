import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';

class PathologicalScoutScreenController extends HelpersController {
  final totalAmountTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final scoutNameTxtField = TextEditingController();
  final descriptionTxtField = TextEditingController();

  @override
  void dispose() {
    totalAmountTxtField.dispose();
    scoutNameTxtField.dispose();
    descriptionTxtField.dispose();
    super.dispose();
  }
}
