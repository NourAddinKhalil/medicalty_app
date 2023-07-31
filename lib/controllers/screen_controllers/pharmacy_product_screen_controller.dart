import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/models/pharmacy_product_model.dart';

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

  var model = PharmacyProductModel.defaultModel;

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
    priceTxtField.dispose();
    productInformationTxtField.dispose();
    productTypeTxtField.dispose();
    productNameTxtField.dispose();
    productDescriptionTxtField.dispose();
    super.dispose();
  }
}
