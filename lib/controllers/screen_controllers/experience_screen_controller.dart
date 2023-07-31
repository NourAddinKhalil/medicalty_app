import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/helpers/enums.dart';
import 'package:medicalty/models/experience_model.dart';

class ExperienceScreenController extends HelpersController {
  final topOfWorkTxtField = TextEditingController();
  final beginningWorkTxtField = TextEditingController();
  final workIsFinishedTxtField = TextEditingController();
  final workPlaceCountryTxtField = TextEditingController();
  final experienceNameTxtField = TextEditingController();
  final placeNameTxtField = TextEditingController();

  var model = ExperienceModel.defaultModel;

  String _image = '';
  String get image => _image;
  void onImageChoosen(String? image) {
    _image = image ?? '';
    model = model.copyWith(
      image: _image,
    );
    update(['image']);
  }

  void onYesNoSelected(YesNoEnum selected) {
    topOfWorkTxtField.text = selected.name;
    model = model.copyWith(still: selected != YesNoEnum.no);
  }

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
