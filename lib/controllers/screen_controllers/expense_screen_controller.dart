import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/models/client_model.dart';
import 'package:medicalty/models/expense_model.dart';

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
  var model = ExpenseModel.defaultModel;

  String _image = '';
  String get image => _image;
  void onImageChoosen(String? image) {
    _image = image ?? '';
    model = model.copyWith(
      image: _image,
    );
    update(['image']);
  }

  void onClientSelected(ClientModel selected) {
    payForTxtField.text = '${selected.firstName} ${selected.lastName}';
    model = model.copyWith(payFor: model.id);
  }

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
