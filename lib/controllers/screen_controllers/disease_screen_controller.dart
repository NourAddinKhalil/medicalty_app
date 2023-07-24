import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/models/disease_model.dart';

class DiseaseScreenController extends HelpersController {
  final productTypeTxtField = TextEditingController();
  final unitNumberTxtField = TextEditingController();
  final unitPriceTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final diseaseNameTxtField = TextEditingController();
  final diseaseDescriptionTxtField = TextEditingController();
  var model = DiseaseModel.defaultModel;

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
    unitPriceTxtField.dispose();
    unitNumberTxtField.dispose();
    productTypeTxtField.dispose();
    diseaseNameTxtField.dispose();
    diseaseDescriptionTxtField.dispose();
    super.dispose();
  }
}
