import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/helpers/convert_to_date_time.dart';
import 'package:medicalty/services/api/multipart_request_helpers.dart';

class ExpenseModel extends Equatable {
  final int id;
  final String address;
  final String? image;
  final String description;
  final TimeOfDay time;
  final DateTime date;
  final double amount;
  final int payFor;
  final String accountingCode;
  final String customerAddress;
  final List<String>? files;

  static ExpenseModel get defaultModel {
    return ExpenseModel(
      address: '',
      description: '',
      time: const TimeOfDay(hour: 12, minute: 12),
      date: DateTime(1999),
      amount: -1,
      payFor: -1,
      accountingCode: '',
      customerAddress: '',
    );
  }

  const ExpenseModel({
    this.id = -1,
    required this.address,
    this.image,
    required this.description,
    required this.time,
    required this.date,
    required this.amount,
    required this.payFor,
    required this.accountingCode,
    required this.customerAddress,
    this.files,
  });

  ExpenseModel copyWith({
    int? id,
    String? address,
    String? image,
    String? description,
    TimeOfDay? time,
    DateTime? date,
    double? amount,
    int? payFor,
    String? accountingCode,
    String? customerAddress,
    List<String>? files,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      address: address ?? this.address,
      image: image ?? this.image,
      description: description ?? this.description,
      time: time ?? this.time,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      payFor: payFor ?? this.payFor,
      accountingCode: accountingCode ?? this.accountingCode,
      customerAddress: customerAddress ?? this.customerAddress,
      files: files ?? this.files,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'image': image != null
          ? MultipartRequestHelpers.getMultipartFile(image!)
          : null,
      'description': description,
      'time': DateTimeHelpers.convertTimeOfDayToString(time),
      'date': DateTimeHelpers.convertDateToString(date),
      'amount': amount,
      'payFor': payFor,
      'accountingCode': accountingCode,
      'customerAddress': customerAddress,
      'files': files
          ?.map((e) => MultipartRequestHelpers.getMultipartFile(e))
          .toList(),
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id']?.toInt() ?? 0,
      address: map['address'] ?? '',
      image: map['image'],
      description: map['description'] ?? '',
      time: map['date'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['time']),
      date: map['date'] == null
          ? DateTime(1999)
          : DateTimeHelpers.convertStringToDate(map['date']),
      amount: map['amount']?.toDouble() ?? 0.0,
      payFor: map['payFor']?.toInt() ?? 0,
      accountingCode: map['accountingCode'] ?? '',
      customerAddress: map['customerAddress'] ?? '',
      files: List<String>.from(map['files']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExpenseModel(id: $id, address: $address, image: $image, description: $description, time: $time, date: $date, amount: $amount, payFor: $payFor, accountingCode: $accountingCode, customerAddress: $customerAddress, files: $files)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      address,
      image,
      description,
      time,
      date,
      amount,
      payFor,
      accountingCode,
      customerAddress,
      files,
    ];
  }
}
