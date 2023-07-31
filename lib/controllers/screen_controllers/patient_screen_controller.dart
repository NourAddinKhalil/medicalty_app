import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/helpers/enums.dart';
import 'package:medicalty/helpers/enums_helpers/blood_typs_helpers.dart';
import 'package:medicalty/models/disease_model.dart';
import 'package:medicalty/models/patient_model.dart';

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

  var model = PatientModel.defaultModel;
  String _image = '';
  String get image => _image;
  void onImageChoosen(String? image) {
    _image = image ?? '';
    model = model.copyWith(
      image: _image,
    );
    update(['image']);
  }

  void onBloodTypeSelected(BloodTypesClass selected) {
    model = model.copyWith(
      bloodType: selected.name,
    );
    bloodTypeTxtField.text = selected.name;
  }

  void onGenderSelected(GenderEnum selected) {
    model = model.copyWith(
      gender: selected.name,
    );
    genderTxtField.text = selected.name;
  }

  void onDiseaseSelected(DiseaseModel selected) {
    model = model.copyWith(
      diseaseName: selected.name,
      diseaseDescription: selected.description,
    );
    diseaseNameTxtField.text = selected.name;
    diseaseDescriptionTxtField.text = selected.description;
  }

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
