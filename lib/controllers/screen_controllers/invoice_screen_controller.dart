import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';

class InvoiceScreenController extends HelpersController {
  final descriptionTxtField = TextEditingController();
  final paymentDueTxtField = TextEditingController();
  final itemsTxtField = TextEditingController();
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

  @override
  void dispose() {
    descriptionTxtField.dispose();
    dateTxtField.dispose();
    payForTxtField.dispose();
    paymentDueTxtField.dispose();
    itemsTxtField.dispose();
    totalValueTxtField.dispose();
    addressTxtField.dispose();
    customerAddressTxtField.dispose();
    accountingCodeTxtField.dispose();
    super.dispose();
  }
}
