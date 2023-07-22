import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';

class ProductScreenController extends HelpersController {
  final productTypeTxtField = TextEditingController();
  final unitNumberTxtField = TextEditingController();
  final unitPriceTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final productNameTxtField = TextEditingController();
  final productDescriptionTxtField = TextEditingController();

  @override
  void dispose() {
    unitPriceTxtField.dispose();
    unitNumberTxtField.dispose();
    productTypeTxtField.dispose();
    productNameTxtField.dispose();
    productDescriptionTxtField.dispose();
    super.dispose();
  }
}
