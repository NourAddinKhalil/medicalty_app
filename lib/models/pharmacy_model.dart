import 'dart:convert';

import 'package:equatable/equatable.dart';

class PharmacyModel extends Equatable {
  final int id;
  final String name;
  final String username;
  final String? logo;
  final String phone;
  final String workPhone;
  final String email;
  final String workEmail;
  final String country;
  final String adress1;
  final String adress2;
  final String state;
  final String province;
  final String? zipCode;
  final String? website;
  final String? facebook;
  final String? instgram;
  final String? snapchat;
  final String? twitter;
  final String? youtube;
  final String? password;

  static PharmacyModel get defaultModel {
    return const PharmacyModel(
      name: '',
      username: '',
      phone: '',
      workPhone: '',
      email: '',
      workEmail: '',
      country: '',
      adress1: '',
      adress2: '',
      state: '',
      province: '',
    );
  }

  const PharmacyModel({
    this.id = -1,
    required this.name,
    required this.username,
    this.logo,
    required this.phone,
    required this.workPhone,
    required this.email,
    required this.workEmail,
    required this.country,
    required this.adress1,
    required this.adress2,
    required this.state,
    required this.province,
    this.zipCode,
    this.website,
    this.facebook,
    this.instgram,
    this.snapchat,
    this.twitter,
    this.youtube,
    this.password,
  });

  PharmacyModel copyWith({
    int? id,
    String? name,
    String? username,
    String? logo,
    String? phone,
    String? workPhone,
    String? email,
    String? workEmail,
    String? country,
    String? adress1,
    String? adress2,
    String? state,
    String? province,
    String? zipCode,
    String? website,
    String? facebook,
    String? instgram,
    String? snapchat,
    String? twitter,
    String? youtube,
    String? password,
  }) {
    return PharmacyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      logo: logo ?? this.logo,
      phone: phone ?? this.phone,
      workPhone: workPhone ?? this.workPhone,
      email: email ?? this.email,
      workEmail: workEmail ?? this.workEmail,
      country: country ?? this.country,
      adress1: adress1 ?? this.adress1,
      adress2: adress2 ?? this.adress2,
      state: state ?? this.state,
      province: province ?? this.province,
      zipCode: zipCode ?? this.zipCode,
      website: website ?? this.website,
      facebook: facebook ?? this.facebook,
      instgram: instgram ?? this.instgram,
      snapchat: snapchat ?? this.snapchat,
      twitter: twitter ?? this.twitter,
      youtube: youtube ?? this.youtube,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'logo': logo,
      'phone': phone,
      'work_phone': workPhone,
      'email': email,
      'work_email': workEmail,
      'country': country,
      'adress1': adress1,
      'adress2': adress2,
      'state': state,
      'province': province,
      'zip_code': zipCode,
      'website': website,
      'facebook': facebook,
      'instgram': instgram,
      'snapchat': snapchat,
      'twitter': twitter,
      'youtube': youtube,
      'password': password,
    };
  }

  factory PharmacyModel.fromMap(Map<String, dynamic> map) {
    return PharmacyModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      logo: map['logo'],
      phone: map['phone'] ?? '',
      workPhone: map['work_phone'] ?? '',
      email: map['email'] ?? '',
      workEmail: map['work_email'] ?? '',
      country: map['country'] ?? '',
      adress1: map['adress1'] ?? '',
      adress2: map['adress2'] ?? '',
      state: map['state'] ?? '',
      province: map['province'] ?? '',
      zipCode: map['zip_code'],
      website: map['website'],
      facebook: map['facebook'],
      instgram: map['instgram'],
      snapchat: map['snapchat'],
      twitter: map['twitter'],
      youtube: map['youtube'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PharmacyModel.fromJson(String source) =>
      PharmacyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PharmacyModel(id: $id, name: $name, username: $username, logo: $logo, phone: $phone, workPhone: $workPhone, email: $email, workEmail: $workEmail, country: $country, adress1: $adress1, adress2: $adress2, state: $state, province: $province, zipCode: $zipCode, website: $website, facebook: $facebook, instgram: $instgram, snapchat: $snapchat, twitter: $twitter, youtube: $youtube, password: $password)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      username,
      logo,
      phone,
      workPhone,
      email,
      workEmail,
      country,
      adress1,
      adress2,
      state,
      province,
      zipCode,
      website,
      facebook,
      instgram,
      snapchat,
      twitter,
      youtube,
      password,
    ];
  }
}
