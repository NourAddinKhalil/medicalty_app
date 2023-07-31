import 'dart:convert';

import 'package:equatable/equatable.dart';

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
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EmployeeModel(id: $id, name: $name, email: $email, phone: $phone, ssn: $ssn, username: $username, image: $image, salaryPerHour: $salaryPerHour, totalSalary: $totalSalary, birthDate: $birthDate, departmentId: $departmentId, schedule: $schedule, workingTime: $workingTime, address: $address, country: $country, province: $province, city: $city, zipCode: $zipCode, gender: $gender, nationality: $nationality)';
  }

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
    ];
  }
}
