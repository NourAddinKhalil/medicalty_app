import 'dart:convert';

import 'package:equatable/equatable.dart';

class PatientModel extends Equatable {
  final int id;
  final String name;
  final String username;
  final DateTime birthDate;
  final String ssn;
  final String phone;
  final String email;
  final String password;
  final String address;
  final double length;
  final double weight;
  final String bloodType;
  final String gender;
  final String nationality;
  final String? country;
  final String? image;
  final int insuranceCompanyId;
  final int fileNo;
  final String diseaseName;
  final String diseaseDescription;

  static PatientModel get defaultModel {
    return PatientModel(
      name: '',
      username: '',
      birthDate: DateTime(1999),
      ssn: '',
      phone: '',
      email: '',
      password: '',
      address: '',
      length: -1,
      weight: -1,
      bloodType: '',
      gender: '',
      nationality: '',
      insuranceCompanyId: -1,
      fileNo: -1,
      diseaseName: '',
      diseaseDescription: '',
    );
  }

  const PatientModel({
    this.id = -1,
    required this.name,
    required this.username,
    required this.birthDate,
    required this.ssn,
    required this.phone,
    required this.email,
    required this.password,
    required this.address,
    required this.length,
    required this.weight,
    required this.bloodType,
    required this.gender,
    required this.nationality,
    this.country,
    this.image,
    required this.insuranceCompanyId,
    required this.fileNo,
    required this.diseaseName,
    required this.diseaseDescription,
  });

  PatientModel copyWith({
    int? id,
    String? name,
    String? username,
    DateTime? birthDate,
    String? ssn,
    String? phone,
    String? email,
    String? password,
    String? address,
    double? length,
    double? weight,
    String? bloodType,
    String? gender,
    String? nationality,
    String? country,
    String? image,
    int? insuranceCompanyId,
    int? fileNo,
    String? diseaseName,
    String? diseaseDescription,
  }) {
    return PatientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      birthDate: birthDate ?? this.birthDate,
      ssn: ssn ?? this.ssn,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      length: length ?? this.length,
      weight: weight ?? this.weight,
      bloodType: bloodType ?? this.bloodType,
      gender: gender ?? this.gender,
      nationality: nationality ?? this.nationality,
      country: country ?? this.country,
      image: image ?? this.image,
      insuranceCompanyId: insuranceCompanyId ?? this.insuranceCompanyId,
      fileNo: fileNo ?? this.fileNo,
      diseaseName: diseaseName ?? this.diseaseName,
      diseaseDescription: diseaseDescription ?? this.diseaseDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'birth_date': birthDate.millisecondsSinceEpoch,
      'ssn': ssn,
      'phone': phone,
      'email': email,
      'password': password,
      'address': address,
      'length': length,
      'weight': weight,
      'bloodType': bloodType,
      'gender': gender,
      'nationality': nationality,
      'country': country,
      'image': image,
      'insurance_company_id': insuranceCompanyId,
      'fileNo': fileNo,
      'diseaseName': diseaseName,
      'diseaseDescription': diseaseDescription,
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      birthDate: DateTime.fromMillisecondsSinceEpoch(map['birth_date']),
      ssn: map['ssn'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      length: map['length']?.toDouble() ?? 0,
      weight: map['weight']?.toDouble() ?? 0,
      bloodType: map['bloodType'] ?? '',
      gender: map['gender'] ?? '',
      nationality: map['nationality'] ?? '',
      country: map['country'],
      image: map['image'],
      insuranceCompanyId: map['insurance_company_id']?.toInt() ?? 0,
      fileNo: map['fileNo']?.toInt() ?? 0,
      diseaseName: map['diseaseName'] ?? '',
      diseaseDescription: map['diseaseDescription'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientModel.fromJson(String source) =>
      PatientModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PatientModel(id: $id, name: $name, username: $username, birthDate: $birthDate, ssn: $ssn, phone: $phone, email: $email, password: $password, address: $address, length: $length, weight: $weight, bloodType: $bloodType, gender: $gender, nationality: $nationality, country: $country, image: $image, insuranceCompanyId: $insuranceCompanyId, fileNo: $fileNo, diseaseName: $diseaseName, diseaseDescription: $diseaseDescription)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      username,
      birthDate,
      ssn,
      phone,
      email,
      password,
      address,
      length,
      weight,
      bloodType,
      gender,
      nationality,
      country,
      image,
      insuranceCompanyId,
      fileNo,
      diseaseName,
      diseaseDescription,
    ];
  }
}
