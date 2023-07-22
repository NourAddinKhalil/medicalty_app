import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/models/center_model.dart';

class CenterScreenController extends HelpersController {
  final centerNameTxtField = TextEditingController();
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
  var model = CenterModel.defaultModel;

  @override
  void dispose() {
    centerNameTxtField.dispose();
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
