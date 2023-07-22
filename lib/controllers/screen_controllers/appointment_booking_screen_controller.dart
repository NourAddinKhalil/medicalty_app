import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/models/appointment_booking_model.dart';

class AppointmentBookingScreenController extends HelpersController {
  final doctorTxtField = TextEditingController();
  final patientTxtField = TextEditingController();
  final endTimeTxtField = TextEditingController();
  final startTimeTxtField = TextEditingController();
  final doctorJobNumberTxtField = TextEditingController();
  final doctorNameTxtField = TextEditingController();
  final patientNameTxtField = TextEditingController();
  final diseaseDescriptionTxtField = TextEditingController();
  var model = AppointmentBookingModel.defaultModel;

  @override
  void dispose() {
    startTimeTxtField.dispose();
    endTimeTxtField.dispose();
    doctorTxtField.dispose();
    patientTxtField.dispose();
    doctorJobNumberTxtField.dispose();
    doctorNameTxtField.dispose();
    patientNameTxtField.dispose();
    diseaseDescriptionTxtField.dispose();
    super.dispose();
  }
}
