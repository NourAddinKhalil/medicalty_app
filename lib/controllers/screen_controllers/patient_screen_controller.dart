import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';

class PatientScreenController extends HelpersController {
  final bloodTypeTxtField = TextEditingController();
  final usernameTxtField = TextEditingController();
  final fileNoTxtField = TextEditingController();
  final fullNameTxtField = TextEditingController();
  final nationalIDTxtField = TextEditingController();
  final emailTxtField = TextEditingController();
  final patientHeightCMTxtField = TextEditingController();
  final patientWeightKGTxtField = TextEditingController();
  final diseaseNameTxtField = TextEditingController();
  final birthDateTxtField = TextEditingController();
  final diseaseDescriptionTxtField = TextEditingController();
  final phoneNumberTxtField = TextEditingController();
  final genderTxtField = TextEditingController();
  final nationaltyTxtField = TextEditingController();
  final addressTxtField = TextEditingController();

  @override
  void dispose() {
    bloodTypeTxtField.dispose();
    usernameTxtField.dispose();
    fullNameTxtField.dispose();
    fileNoTxtField.dispose();
    nationalIDTxtField.dispose();
    emailTxtField.dispose();
    patientHeightCMTxtField.dispose();
    phoneNumberTxtField.dispose();
    patientWeightKGTxtField.dispose();
    diseaseNameTxtField.dispose();
    birthDateTxtField.dispose();
    diseaseDescriptionTxtField.dispose();
    genderTxtField.dispose();
    nationaltyTxtField.dispose();
    addressTxtField.dispose();
    super.dispose();
  }
}
