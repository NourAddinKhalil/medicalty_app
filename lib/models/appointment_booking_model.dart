import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/helpers/convert_to_date_time.dart';

class AppointmentBookingModel extends Equatable {
  final int id;
  final int doctorId;
  final String doctorName;
  final String doctorJobNumber;
  final String doctorImage;
  final int patientId;
  final String patientImage;
  final String patientName;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String diseaseDecription;

  static AppointmentBookingModel get defaultModel {
    return const AppointmentBookingModel(
      doctorId: -1,
      doctorName: '',
      doctorJobNumber: '',
      doctorImage: '',
      patientId: -1,
      patientImage: '',
      patientName: '',
      startTime: TimeOfDay(hour: 12, minute: 12),
      endTime: TimeOfDay(hour: 12, minute: 12),
      diseaseDecription: '',
    );
  }

  const AppointmentBookingModel({
    this.id = -1,
    required this.doctorId,
    required this.doctorName,
    required this.doctorJobNumber,
    required this.doctorImage,
    required this.patientId,
    required this.patientImage,
    required this.patientName,
    required this.startTime,
    required this.endTime,
    required this.diseaseDecription,
  });

  AppointmentBookingModel copyWith({
    int? id,
    int? doctorId,
    String? doctorName,
    String? doctorJobNumber,
    String? doctorImage,
    int? patientId,
    String? patientImage,
    String? patientName,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? diseaseDecription,
  }) {
    return AppointmentBookingModel(
      id: id ?? this.id,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      doctorJobNumber: doctorJobNumber ?? this.doctorJobNumber,
      doctorImage: doctorImage ?? this.doctorImage,
      patientId: patientId ?? this.patientId,
      patientImage: patientImage ?? this.patientImage,
      patientName: patientName ?? this.patientName,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      diseaseDecription: diseaseDecription ?? this.diseaseDecription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'doctorJobNumber': doctorJobNumber,
      'doctorImage': doctorImage,
      'patientId': patientId,
      'patientImage': patientImage,
      'patientName': patientName,
      'startTime': DateTimeHelpers.convertTimeOfDayToString(startTime),
      'endTime': DateTimeHelpers.convertTimeOfDayToString(endTime),
      'diseaseDecription': diseaseDecription,
    };
  }

  factory AppointmentBookingModel.fromMap(Map<String, dynamic> map) {
    return AppointmentBookingModel(
      id: map['id']?.toInt() ?? 0,
      doctorId: map['doctorId']?.toInt() ?? 0,
      doctorName: map['doctorName'] ?? '',
      doctorJobNumber: map['doctorJobNumber'] ?? '',
      doctorImage: map['doctorImage'] ?? '',
      patientId: map['patientId']?.toInt() ?? 0,
      patientImage: map['patientImage'] ?? '',
      patientName: map['patientName'] ?? '',
      startTime: map['startTime'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['startTime']),
      endTime: map['endTime'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['endTime']),
      diseaseDecription: map['diseaseDecription'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentBookingModel.fromJson(String source) =>
      AppointmentBookingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppointmentBookingModel(id: $id, doctorId: $doctorId, doctorName: $doctorName, doctorJobNumber: $doctorJobNumber, doctorImage: $doctorImage, patientId: $patientId, patientImage: $patientImage, patientName: $patientName, startTime: $startTime, endTime: $endTime, diseaseDecription: $diseaseDecription)';
  }

  @override
  List<Object> get props {
    return [
      id,
      doctorId,
      doctorName,
      doctorJobNumber,
      doctorImage,
      patientId,
      patientImage,
      patientName,
      startTime,
      endTime,
      diseaseDecription,
    ];
  }
}
