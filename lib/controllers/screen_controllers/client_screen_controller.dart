import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/models/client_model.dart';

class ClientScreenController extends HelpersController {
  final firstNameTxtField = TextEditingController();
  final personPrefixTxtField = TextEditingController();
  final lastNameTxtField = TextEditingController();
  final companyTxtField = TextEditingController();
  final phoneTxtField = TextEditingController();
  final phoneTypeTxtField = TextEditingController();
  final emailTxtField = TextEditingController();
  final emailTypeTxtField = TextEditingController();
  final attributedToTxtField = TextEditingController();
  final addressTxtField = TextEditingController();
  final address2TxtField = TextEditingController();
  final cityTxtField = TextEditingController();
  final inturuptTxtField = TextEditingController();
  final zipCodeTxtField = TextEditingController();
  final countryTxtField = TextEditingController();

  var model = ClientModel.defaultModel;

  @override
  void dispose() {
    firstNameTxtField.dispose();
    personPrefixTxtField.dispose();
    lastNameTxtField.dispose();
    phoneTxtField.dispose();
    phoneTypeTxtField.dispose();
    companyTxtField.dispose();
    emailTxtField.dispose();
    emailTypeTxtField.dispose();
    attributedToTxtField.dispose();
    countryTxtField.dispose();
    addressTxtField.dispose();
    address2TxtField.dispose();
    cityTxtField.dispose();
    inturuptTxtField.dispose();
    zipCodeTxtField.dispose();
    super.dispose();
  }
}
