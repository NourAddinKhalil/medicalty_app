import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';

class PharmacyProductScreenController extends HelpersController {
  final productTypeTxtField = TextEditingController();
  final productInformationTxtField = TextEditingController();
  final priceTxtField = CurrencyTextFieldController(
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
    priceTxtField.dispose();
    productInformationTxtField.dispose();
    productTypeTxtField.dispose();
    productNameTxtField.dispose();
    productDescriptionTxtField.dispose();
    super.dispose();
  }
}
