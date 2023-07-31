import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/models/pharmacy_model.dart';

class PharmacyScreenController extends HelpersController {
  final nameTxtField = TextEditingController();
  final userNameTxtField = TextEditingController();
  final phoneTxtField = TextEditingController();
  final phone2TxtField = TextEditingController();
  final websiteTxtField = TextEditingController();
  final emailTxtField = TextEditingController();
  final officialEmailTxtField = TextEditingController();
  final countryTxtField = TextEditingController();
  final addressTxtField = TextEditingController();
  final address2TxtField = TextEditingController();
  final stateTxtField = TextEditingController();
  final districtTxtField = TextEditingController();
  final postalCodeTxtField = TextEditingController();
  final facebookTxtField = TextEditingController();
  final twitterTxtField = TextEditingController();
  final instgramTxtField = TextEditingController();
  final linkedinTxtField = TextEditingController();
  final youtubeTxtField = TextEditingController();

  var model = PharmacyModel.defaultModel;

  String _image = '';
  String get image => _image;
  void onImageChoosen(String? image) {
    _image = image ?? '';
    model = model.copyWith(
      logo: _image,
    );
    update(['image']);
  }

  @override
  void dispose() {
    nameTxtField.dispose();
    userNameTxtField.dispose();
    phoneTxtField.dispose();
    phone2TxtField.dispose();
    websiteTxtField.dispose();
    emailTxtField.dispose();
    officialEmailTxtField.dispose();
    countryTxtField.dispose();
    addressTxtField.dispose();
    address2TxtField.dispose();
    stateTxtField.dispose();
    districtTxtField.dispose();
    postalCodeTxtField.dispose();
    facebookTxtField.dispose();
    twitterTxtField.dispose();
    instgramTxtField.dispose();
    linkedinTxtField.dispose();
    youtubeTxtField.dispose();
    super.dispose();
  }
}
