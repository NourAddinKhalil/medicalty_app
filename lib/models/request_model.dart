import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/helpers/convert_to_date_time.dart';
import 'package:medicalty/services/api/multipart_request_helpers.dart';

class RequestModel extends Equatable {
  final int id;
  final int? clientId;
  final int? patientId;
  final String requestAddress;
  final String details;
  final String comments;
  final TimeOfDay time;
  final DateTime date;
  final TimeOfDay startingTime;
  final TimeOfDay endingTime;
  final int supervisor;
  final String notes;
  final String? image;

  static RequestModel get defaultModel {
    return RequestModel(
      requestAddress: '',
      details: '',
      comments: '',
      time: const TimeOfDay(hour: 12, minute: 12),
      date: DateTime(1999),
      startingTime: const TimeOfDay(hour: 12, minute: 12),
      endingTime: const TimeOfDay(hour: 12, minute: 12),
      supervisor: -1,
      notes: '',
    );
  }

  const RequestModel(
      {this.id = -1,
      this.clientId,
      this.patientId,
      required this.requestAddress,
      required this.details,
      required this.comments,
      required this.time,
      required this.date,
      required this.startingTime,
      required this.endingTime,
      required this.supervisor,
      required this.notes,
      this.image});

  RequestModel copyWith({
    int? id,
    int? clientId,
    int? patientId,
    String? requestAddress,
    String? details,
    String? comments,
    TimeOfDay? time,
    DateTime? date,
    TimeOfDay? startingTime,
    TimeOfDay? endingTime,
    int? supervisor,
    String? notes,
    String? image,
  }) {
    return RequestModel(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      patientId: patientId ?? this.patientId,
      requestAddress: requestAddress ?? this.requestAddress,
      details: details ?? this.details,
      comments: comments ?? this.comments,
      time: time ?? this.time,
      date: date ?? this.date,
      startingTime: startingTime ?? this.startingTime,
      endingTime: endingTime ?? this.endingTime,
      supervisor: supervisor ?? this.supervisor,
      notes: notes ?? this.notes,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clientId': clientId,
      'patientId': patientId,
      'requestAddress': requestAddress,
      'details': details,
      'comments': comments,
      'time': DateTimeHelpers.convertTimeOfDayToString(time),
      'date': DateTimeHelpers.convertDateToString(date),
      'startingTime': DateTimeHelpers.convertTimeOfDayToString(startingTime),
      'endingTime': DateTimeHelpers.convertTimeOfDayToString(endingTime),
      'supervisor': supervisor,
      'notes': notes,
      'image': image == null
          ? null
          : MultipartRequestHelpers.getMultipartFile(image!),
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      id: map['id']?.toInt() ?? 0,
      clientId: map['clientId']?.toInt(),
      patientId: map['patientId']?.toInt(),
      requestAddress: map['requestAddress'] ?? '',
      details: map['details'] ?? '',
      comments: map['comments'] ?? '',
      time: map['time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['time']),
      date: map['date'] == null
          ? DateTime(1999)
          : DateTimeHelpers.convertStringToDate(map['date']),
      startingTime: map['startingTime'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['startingTime']),
      endingTime: map['endingTime'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['endingTime']),
      supervisor: map['supervisor']?.toInt() ?? 0,
      notes: map['notes'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) =>
      RequestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RequestModel(id: $id, clientId: $clientId, patientId: $patientId, requestAddress: $requestAddress, details: $details, comments: $comments, time: $time, date: $date, startingTime: $startingTime, endingTime: $endingTime, supervisor: $supervisor, notes: $notes, image: $image)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      clientId,
      patientId,
      requestAddress,
      details,
      comments,
      time,
      date,
      startingTime,
      endingTime,
      supervisor,
      notes,
      image,
    ];
  }
}
