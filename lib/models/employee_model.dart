import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:medicalty/helpers/convert_to_date_time.dart';

class EmployeeModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String ssn;
  final String username;
  final String? image;
  final double salaryPerHour;
  final double totalSalary;
  final DateTime birthDate;
  final int departmentId;
  final String schedule;
  final String workingTime;
  final String? address;
  final String country;
  final String? province;
  final String city;
  final String? zipCode;
  final String gender;
  final String nationality;
  final TimeOfDay? sundayStartTime;
  final TimeOfDay? sundayEndTime;
  final TimeOfDay? mondayStartTime;
  final TimeOfDay? mondayEndTime;
  final TimeOfDay? tuesdayStartTime;
  final TimeOfDay? tuesdayEndTime;
  final TimeOfDay? wednesdayStartTime;
  final TimeOfDay? wednesdayEndTime;
  final TimeOfDay? thursdayStartTime;
  final TimeOfDay? thursdayEndTime;
  final TimeOfDay? fridayStartTime;
  final TimeOfDay? fridayEndTime;
  final TimeOfDay? saturdayStartTime;
  final TimeOfDay? saturdayEndTime;

  static EmployeeModel get defaultModel {
    return EmployeeModel(
      name: '',
      email: '',
      phone: '',
      ssn: '',
      username: '',
      salaryPerHour: -1,
      totalSalary: -1,
      birthDate: DateTime(1999),
      departmentId: -1,
      schedule: '',
      workingTime: '',
      country: '',
      city: '',
      gender: '',
      nationality: '',
    );
  }

  const EmployeeModel({
    this.id = -1,
    required this.name,
    required this.email,
    required this.phone,
    required this.ssn,
    required this.username,
    this.image,
    required this.salaryPerHour,
    required this.totalSalary,
    required this.birthDate,
    required this.departmentId,
    required this.schedule,
    required this.workingTime,
    this.address,
    required this.country,
    this.province,
    required this.city,
    this.zipCode,
    required this.gender,
    required this.nationality,
    this.sundayStartTime,
    this.sundayEndTime,
    this.mondayStartTime,
    this.mondayEndTime,
    this.tuesdayStartTime,
    this.tuesdayEndTime,
    this.wednesdayStartTime,
    this.wednesdayEndTime,
    this.thursdayStartTime,
    this.thursdayEndTime,
    this.fridayStartTime,
    this.fridayEndTime,
    this.saturdayStartTime,
    this.saturdayEndTime,
  });

  EmployeeModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? ssn,
    String? username,
    String? image,
    double? salaryPerHour,
    double? totalSalary,
    DateTime? birthDate,
    int? departmentId,
    String? schedule,
    String? workingTime,
    String? address,
    String? country,
    String? province,
    String? city,
    String? zipCode,
    String? gender,
    String? nationality,
    TimeOfDay? sundayStartTime,
    TimeOfDay? sundayEndTime,
    TimeOfDay? mondayStartTime,
    TimeOfDay? mondayEndTime,
    TimeOfDay? tuesdayStartTime,
    TimeOfDay? tuesdayEndTime,
    TimeOfDay? wednesdayStartTime,
    TimeOfDay? wednesdayEndTime,
    TimeOfDay? thursdayStartTime,
    TimeOfDay? thursdayEndTime,
    TimeOfDay? fridayStartTime,
    TimeOfDay? fridayEndTime,
    TimeOfDay? saturdayStartTime,
    TimeOfDay? saturdayEndTime,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      ssn: ssn ?? this.ssn,
      username: username ?? this.username,
      image: image ?? this.image,
      salaryPerHour: salaryPerHour ?? this.salaryPerHour,
      totalSalary: totalSalary ?? this.totalSalary,
      birthDate: birthDate ?? this.birthDate,
      departmentId: departmentId ?? this.departmentId,
      schedule: schedule ?? this.schedule,
      workingTime: workingTime ?? this.workingTime,
      address: address ?? this.address,
      country: country ?? this.country,
      province: province ?? this.province,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      gender: gender ?? this.gender,
      nationality: nationality ?? this.nationality,
      sundayStartTime: sundayStartTime ?? this.sundayStartTime,
      sundayEndTime: sundayEndTime ?? this.sundayEndTime,
      mondayStartTime: mondayStartTime ?? this.mondayStartTime,
      mondayEndTime: mondayEndTime ?? this.mondayEndTime,
      tuesdayStartTime: tuesdayStartTime ?? this.tuesdayStartTime,
      tuesdayEndTime: tuesdayEndTime ?? this.tuesdayEndTime,
      wednesdayStartTime: wednesdayStartTime ?? this.wednesdayStartTime,
      wednesdayEndTime: wednesdayEndTime ?? this.wednesdayEndTime,
      thursdayStartTime: thursdayStartTime ?? this.thursdayStartTime,
      thursdayEndTime: thursdayEndTime ?? this.thursdayEndTime,
      fridayStartTime: fridayStartTime ?? this.fridayStartTime,
      fridayEndTime: fridayEndTime ?? this.fridayEndTime,
      saturdayStartTime: saturdayStartTime ?? this.saturdayStartTime,
      saturdayEndTime: saturdayEndTime ?? this.saturdayEndTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'ssn': ssn,
      'username': username,
      'image': image,
      'salary_per_hour': salaryPerHour,
      'total_salary': totalSalary,
      'birth_date': birthDate.millisecondsSinceEpoch,
      'department_id': departmentId,
      'schedule': schedule,
      'workingTime': workingTime,
      'address': address,
      'country': country,
      'province': province,
      'city': city,
      'zip_code': zipCode,
      'gender': gender,
      'nationality': nationality,
      'Sunday_start_time':
          DateTimeHelpers.isTimeNullOrDefaultValue(sundayStartTime)
              ? null
              : DateTimeHelpers.convertTimeOfDayToString(sundayStartTime!),
      'Sunday_end_time': DateTimeHelpers.isTimeNullOrDefaultValue(sundayEndTime)
          ? null
          : DateTimeHelpers.convertTimeOfDayToString(sundayEndTime!),
      'Monday_start_time':
          DateTimeHelpers.isTimeNullOrDefaultValue(mondayStartTime)
              ? null
              : DateTimeHelpers.convertTimeOfDayToString(mondayStartTime!),
      'Monday_end_time': DateTimeHelpers.isTimeNullOrDefaultValue(mondayEndTime)
          ? null
          : DateTimeHelpers.convertTimeOfDayToString(mondayEndTime!),
      'Tuesday_start_time':
          DateTimeHelpers.isTimeNullOrDefaultValue(tuesdayStartTime)
              ? null
              : DateTimeHelpers.convertTimeOfDayToString(tuesdayStartTime!),
      'Tuesday_end_time':
          DateTimeHelpers.isTimeNullOrDefaultValue(tuesdayEndTime)
              ? null
              : DateTimeHelpers.convertTimeOfDayToString(tuesdayEndTime!),
      'Wednesday_start_time':
          DateTimeHelpers.isTimeNullOrDefaultValue(wednesdayStartTime)
              ? null
              : DateTimeHelpers.convertTimeOfDayToString(wednesdayStartTime!),
      'Wednesday_end_time':
          DateTimeHelpers.isTimeNullOrDefaultValue(wednesdayEndTime)
              ? null
              : DateTimeHelpers.convertTimeOfDayToString(wednesdayEndTime!),
      'Thursday_start_time':
          DateTimeHelpers.isTimeNullOrDefaultValue(thursdayStartTime)
              ? null
              : DateTimeHelpers.convertTimeOfDayToString(thursdayStartTime!),
      'Thursday_end_time':
          DateTimeHelpers.isTimeNullOrDefaultValue(thursdayEndTime)
              ? null
              : DateTimeHelpers.convertTimeOfDayToString(thursdayEndTime!),
      'Friday_start_time':
          DateTimeHelpers.isTimeNullOrDefaultValue(fridayStartTime)
              ? null
              : DateTimeHelpers.convertTimeOfDayToString(fridayStartTime!),
      'Friday_end_time': DateTimeHelpers.isTimeNullOrDefaultValue(fridayEndTime)
          ? null
          : DateTimeHelpers.convertTimeOfDayToString(fridayEndTime!),
      'Saturday_start_time':
          DateTimeHelpers.isTimeNullOrDefaultValue(saturdayStartTime)
              ? null
              : DateTimeHelpers.convertTimeOfDayToString(saturdayStartTime!),
      'Saturday_end_time':
          DateTimeHelpers.isTimeNullOrDefaultValue(saturdayEndTime)
              ? null
              : DateTimeHelpers.convertTimeOfDayToString(saturdayEndTime!),
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      ssn: map['ssn'] ?? '',
      username: map['username'] ?? '',
      image: map['image'],
      salaryPerHour: map['salary_per_hour']?.toDouble() ?? 0.0,
      totalSalary: map['total_salary']?.toDouble() ?? 0.0,
      birthDate: DateTime.fromMillisecondsSinceEpoch(map['birth_date']),
      departmentId: map['department_id']?.toInt() ?? 0,
      schedule: map['schedule'] ?? '',
      workingTime: map['workingTime'] ?? '',
      address: map['address'],
      country: map['country'] ?? '',
      province: map['province'],
      city: map['city'] ?? '',
      zipCode: map['zip_code'],
      gender: map['gender'] ?? '',
      nationality: map['nationality'] ?? '',
      sundayStartTime: map['Sunday_start_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Sunday_start_time']),
      sundayEndTime: map['Sunday_end_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Sunday_end_time']),
      mondayStartTime: map['Monday_start_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Monday_start_time']),
      mondayEndTime: map['Monday_end_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Monday_end_time']),
      tuesdayStartTime: map['Tuesday_start_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Tuesday_start_time']),
      tuesdayEndTime: map['Tuesday_end_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Tuesday_end_time']),
      wednesdayStartTime: map['Wednesday_start_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Wednesday_start_time']),
      wednesdayEndTime: map['Wednesday_end_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Wednesday_end_time']),
      thursdayStartTime: map['Thursday_start_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Thursday_start_time']),
      thursdayEndTime: map['Thursday_end_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Thursday_end_time']),
      fridayStartTime: map['Friday_start_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Friday_start_time']),
      fridayEndTime: map['Friday_end_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Friday_end_time']),
      saturdayStartTime: map['Saturday_start_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Saturday_start_time']),
      saturdayEndTime: map['Saturday_end_time'] == null
          ? const TimeOfDay(hour: 12, minute: 12)
          : DateTimeHelpers.convertToTimeOfDayV2(map['Saturday_end_time']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source));

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      ssn,
      username,
      image,
      salaryPerHour,
      totalSalary,
      birthDate,
      departmentId,
      schedule,
      workingTime,
      address,
      country,
      province,
      city,
      zipCode,
      gender,
      nationality,
      sundayStartTime,
      sundayEndTime,
      mondayStartTime,
      mondayEndTime,
      tuesdayStartTime,
      tuesdayEndTime,
      wednesdayStartTime,
      wednesdayEndTime,
      thursdayStartTime,
      thursdayEndTime,
      fridayStartTime,
      fridayEndTime,
      saturdayStartTime,
      saturdayEndTime,
    ];
  }

  @override
  String toString() {
    return 'EmployeeModel(id: $id, name: $name, email: $email, phone: $phone, ssn: $ssn, username: $username, image: $image, salaryPerHour: $salaryPerHour, totalSalary: $totalSalary, birthDate: $birthDate, departmentId: $departmentId, schedule: $schedule, workingTime: $workingTime, address: $address, country: $country, province: $province, city: $city, zipCode: $zipCode, gender: $gender, nationality: $nationality, sundayStartTime: $sundayStartTime, sundayEndTime: $sundayEndTime, mondayStartTime: $mondayStartTime, mondayEndTime: $mondayEndTime, tuesdayStartTime: $tuesdayStartTime, tuesdayEndTime: $tuesdayEndTime, wednesdayStartTime: $wednesdayStartTime, wednesdayEndTime: $wednesdayEndTime, thursdayStartTime: $thursdayStartTime, thursdayEndTime: $thursdayEndTime, fridayStartTime: $fridayStartTime, fridayEndTime: $fridayEndTime, saturdayStartTime: $saturdayStartTime, saturdayEndTime: $saturdayEndTime)';
  }
}
