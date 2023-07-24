import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/models/request_model.dart';

class RequestScreenController extends HelpersController {
  final clientTxtField = TextEditingController();
  final clientPatientsMultiTxtField = TextEditingController();
  final supervisingPhysicianTxtField = TextEditingController();
  final dateTxtField = TextEditingController();
  final startingTimeTxtField = TextEditingController();
  final endingTimeTxtField = TextEditingController();
  final commentsTxtField = TextEditingController();
  // CurrencyTextFieldController(
  //   decimalSymbol: '.',
  //   thousandSymbol: ',',
  //   initDoubleValue: 0.00,
  //   enableNegative: false,
  //   currencySymbol: '\$',
  // );
  final reservationTimesTxtField = TextEditingController();
  final requestAddressTxtField = TextEditingController();
  final serviceDetailsTxtField = TextEditingController();
  final notesTxtField = TextEditingController();

  var model = RequestModel.defaultModel;

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
    dateTxtField.dispose();
    startingTimeTxtField.dispose();
    endingTimeTxtField.dispose();
    clientTxtField.dispose();
    supervisingPhysicianTxtField.dispose();
    clientPatientsMultiTxtField.dispose();
    commentsTxtField.dispose();
    reservationTimesTxtField.dispose();
    requestAddressTxtField.dispose();
    serviceDetailsTxtField.dispose();
    notesTxtField.dispose();
    super.dispose();
  }
}
