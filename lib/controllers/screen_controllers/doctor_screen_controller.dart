import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';

class DoctorScreenController extends HelpersController {
  final jobTxtField = TextEditingController();
  final departmentTxtField = TextEditingController();
  final usernameTxtField = TextEditingController();
  final jobNumberTxtField = TextEditingController();
  final fullNameTxtField = TextEditingController();
  final workEmailTxtField = TextEditingController();
  final nationalIDTxtField = TextEditingController();
  final emailTxtField = TextEditingController();
  final jobDescriptionTxtField = TextEditingController();
  final aboutDoctorTxtField = TextEditingController();
  final comprehensiveprofileTxtField = TextEditingController();
  final birthDateTxtField = TextEditingController();
  final yearsOfExperienceTxtField = TextEditingController();
  final experienceTxtField = TextEditingController();
  final workPhoneNumberTxtField = TextEditingController();
  final phoneNumberTxtField = TextEditingController();
  final genderTxtField = TextEditingController();
  final nationaltyTxtField = TextEditingController();
  final addressTxtField = TextEditingController();
  final salaryTxtField = CurrencyTextFieldController(
    currencySymbol: '\$',
    decimalSymbol: '.',
    thousandSymbol: ',',
    enableNegative: false,
    initDoubleValue: 0.00,
  );
  Future<void> save() async {}

  @override
  void dispose() {
    jobTxtField.dispose();
    departmentTxtField.dispose();
    usernameTxtField.dispose();
    fullNameTxtField.dispose();
    workEmailTxtField.dispose();
    jobNumberTxtField.dispose();
    nationalIDTxtField.dispose();
    emailTxtField.dispose();
    jobDescriptionTxtField.dispose();
    workPhoneNumberTxtField.dispose();
    phoneNumberTxtField.dispose();
    aboutDoctorTxtField.dispose();
    comprehensiveprofileTxtField.dispose();
    birthDateTxtField.dispose();
    yearsOfExperienceTxtField.dispose();
    experienceTxtField.dispose();
    genderTxtField.dispose();
    nationaltyTxtField.dispose();
    addressTxtField.dispose();
    salaryTxtField.dispose();
    super.dispose();
  }
}
