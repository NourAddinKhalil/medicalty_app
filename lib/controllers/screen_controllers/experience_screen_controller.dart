import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';

class ExperienceScreenController extends HelpersController {
  final topOfWorkTxtField = TextEditingController();
  final beginningWorkTxtField = TextEditingController();
  final workIsFinishedTxtField = TextEditingController();
  final workPlaceCountryTxtField = TextEditingController();
  final experienceNameTxtField = TextEditingController();
  final placeNameTxtField = TextEditingController();

  @override
  void dispose() {
    workPlaceCountryTxtField.dispose();
    beginningWorkTxtField.dispose();
    workIsFinishedTxtField.dispose();
    topOfWorkTxtField.dispose();
    experienceNameTxtField.dispose();
    placeNameTxtField.dispose();
    super.dispose();
  }
}
