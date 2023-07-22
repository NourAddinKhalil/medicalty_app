import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';

class LabScreenController extends HelpersController {
  final passwordTxtField = TextEditingController();
  final websiteTxtField = TextEditingController();
  final workingTimeTxtField = TextEditingController();
  final phoneNumberTxtField = TextEditingController();
  final emailTxtField = TextEditingController();
  final nameTxtField = TextEditingController();
  final addressTxtField = TextEditingController();

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
