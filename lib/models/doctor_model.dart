import 'dart:convert';

import 'package:equatable/equatable.dart';

class DoctorModel extends Equatable {
  final int id;
  final int specialty;
  final int jobId;
  final String name;
  final String image;
  final String username;
  final String phone;
  final String workPhone;
  final String email;
  final String workEmail;
  final String ssn;
  final String password;
  final String jobDescription;
  final String fullBrief;
  final String abstract;
  final DateTime birthDate;
  final int experienceYears;
  final String address;
  final double salary;
  final String gender;
  final String nationality;

  static DoctorModel get defaultModel {
    return DoctorModel(
      specialty: -1,
      jobId: -1,
      name: '',
      image: '',
      username: '',
      phone: '',
      workPhone: '',
      email: '',
      workEmail: '',
      ssn: '',
      password: '',
      jobDescription: '',
      fullBrief: '',
      abstract: '',
      birthDate: DateTime(1999),
      experienceYears: -1,
      address: '',
      salary: -1,
      gender: '',
      nationality: '',
    );
  }

  const DoctorModel({
    this.id = -1,
    required this.specialty,
    required this.jobId,
    required this.name,
    required this.image,
    required this.username,
    required this.phone,
    required this.workPhone,
    required this.email,
    required this.workEmail,
    required this.ssn,
    required this.password,
    required this.jobDescription,
    required this.fullBrief,
    required this.abstract,
    required this.birthDate,
    required this.experienceYears,
    required this.address,
    required this.salary,
    required this.gender,
    required this.nationality,
  });

  DoctorModel copyWith({
    int? id,
    int? specialty,
    int? jobId,
    String? name,
    String? image,
    String? username,
    String? phone,
    String? workPhone,
    String? email,
    String? workEmail,
    String? ssn,
    String? password,
    String? jobDescription,
    String? fullBrief,
    String? abstract,
    DateTime? birthDate,
    int? experienceYears,
    String? address,
    double? salary,
    String? gender,
    String? nationality,
  }) {
    return DoctorModel(
      id: id ?? this.id,
      specialty: specialty ?? this.specialty,
      jobId: jobId ?? this.jobId,
      name: name ?? this.name,
      image: image ?? this.image,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      workPhone: workPhone ?? this.workPhone,
      email: email ?? this.email,
      workEmail: workEmail ?? this.workEmail,
      ssn: ssn ?? this.ssn,
      password: password ?? this.password,
      jobDescription: jobDescription ?? this.jobDescription,
      fullBrief: fullBrief ?? this.fullBrief,
      abstract: abstract ?? this.abstract,
      birthDate: birthDate ?? this.birthDate,
      experienceYears: experienceYears ?? this.experienceYears,
      address: address ?? this.address,
      salary: salary ?? this.salary,
      gender: gender ?? this.gender,
      nationality: nationality ?? this.nationality,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'specialty': specialty,
      'job_id': jobId,
      'name': name,
      'image': image,
      'username': username,
      'phone': phone,
      'work_phone': workPhone,
      'email': email,
      'work_email': workEmail,
      'ssn': ssn,
      'password': password,
      'job_description': jobDescription,
      'full_brief': fullBrief,
      'abstract': abstract,
      'birth_date': birthDate.millisecondsSinceEpoch,
      'experience_years': experienceYears,
      'address': address,
      'salary': salary,
      'gender': gender,
      'nationality': nationality,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      id: map['id']?.toInt() ?? 0,
      specialty: map['specialty']?.toInt() ?? 0,
      jobId: map['job_id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      username: map['username'] ?? '',
      phone: map['phone'] ?? '',
      workPhone: map['work_phone'] ?? '',
      email: map['email'] ?? '',
      workEmail: map['work_email'] ?? '',
      ssn: map['ssn'] ?? '',
      password: map['password'] ?? '',
      jobDescription: map['job_description'] ?? '',
      fullBrief: map['full_brief'] ?? '',
      abstract: map['abstract'] ?? '',
      birthDate: DateTime.fromMillisecondsSinceEpoch(map['birth_date']),
      experienceYears: map['experience_years']?.toInt() ?? 0,
      address: map['address'] ?? '',
      salary: map['salary']?.toDouble() ?? 0.0,
      gender: map['gender'] ?? '',
      nationality: map['nationality'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromJson(String source) =>
      DoctorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DoctorModel(id: $id, specialty: $specialty, jobId: $jobId, name: $name, image: $image, username: $username, phone: $phone, workPhone: $workPhone, email: $email, workEmail: $workEmail, ssn: $ssn, password: $password, jobDescription: $jobDescription, fullBrief: $fullBrief, abstract: $abstract, birthDate: $birthDate, experienceYears: $experienceYears, address: $address, salary: $salary, gender: $gender, nationality: $nationality)';
  }

  @override
  List<Object> get props {
    return [
      id,
      specialty,
      jobId,
      name,
      image,
      username,
      phone,
      workPhone,
      email,
      workEmail,
      ssn,
      password,
      jobDescription,
      fullBrief,
      abstract,
      birthDate,
      experienceYears,
      address,
      salary,
      gender,
      nationality,
    ];
  }
}
