import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';

class ExpenseScreenController extends HelpersController {
  final descriptionTxtField = TextEditingController();
  final timeTxtField = TextEditingController();
  final dateTxtField = TextEditingController();
  final payForTxtField = TextEditingController();
  final totalValueTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final addressTxtField = TextEditingController();
  final customerAddressTxtField = TextEditingController();
  final accountingCodeTxtField = TextEditingController();

  Future<void> save() async {}

  @override
  void dispose() {
    descriptionTxtField.dispose();
    dateTxtField.dispose();
    payForTxtField.dispose();
    timeTxtField.dispose();
    totalValueTxtField.dispose();
    addressTxtField.dispose();
    customerAddressTxtField.dispose();
    accountingCodeTxtField.dispose();
    super.dispose();
  }
}
