import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/models/lab_model.dart';

class LabScreenController extends HelpersController {
  final passwordTxtField = TextEditingController();
  final websiteTxtField = TextEditingController();
  final workingTimeTxtField = TextEditingController();
  final phoneNumberTxtField = TextEditingController();
  final emailTxtField = TextEditingController();
  final nameTxtField = TextEditingController();
  final addressTxtField = TextEditingController();

  var model = LabModel.defaultModel;

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
    websiteTxtField.dispose();
    workingTimeTxtField.dispose();
    passwordTxtField.dispose();
    phoneNumberTxtField.dispose();
    emailTxtField.dispose();
    nameTxtField.dispose();
    addressTxtField.dispose();
    super.dispose();
  }
}
