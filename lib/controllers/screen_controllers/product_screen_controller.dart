import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/helpers/enums.dart';
import 'package:medicalty/models/product_model.dart';

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
  var model = ProductModel.defaultModel;

  String _image = '';
  String get image => _image;
  void onImageChoosen(String? image) {
    _image = image ?? '';
    model = model.copyWith(
      image: _image,
    );
    update(['image']);
  }

  void onProductTypeSelected(ProductsTypeEnum selected) {
    model = model.copyWith(type: selected);
    productTypeTxtField.text = selected.name;
  }

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
