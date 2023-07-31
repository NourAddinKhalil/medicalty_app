import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/models/pathological_scout_model.dart';

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
  var model = PathologicalScoutModel.defaultModel;

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
    totalAmountTxtField.dispose();
    scoutNameTxtField.dispose();
    descriptionTxtField.dispose();
    super.dispose();
  }
}
