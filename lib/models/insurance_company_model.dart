import 'dart:convert';

import 'package:equatable/equatable.dart';

class InsuranceCompanyModel extends Equatable {
  final int id;
  final String name;
  final String decription;
  final String username;
  final String? logo;
  final String phone;
  final String formalPhone;
  final String email;
  final String formalEmail;
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

  static InsuranceCompanyModel get defaultModel {
    return const InsuranceCompanyModel(
      name: '',
      decription: '',
      username: '',
      phone: '',
      formalPhone: '',
      email: '',
      formalEmail: '',
      country: '',
      adress1: '',
      adress2: '',
      state: '',
      province: '',
    );
  }

  const InsuranceCompanyModel({
    this.id = -1,
    required this.name,
    required this.decription,
    required this.username,
    this.logo,
    required this.phone,
    required this.formalPhone,
    required this.email,
    required this.formalEmail,
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

  InsuranceCompanyModel copyWith({
    int? id,
    String? name,
    String? decription,
    String? username,
    String? logo,
    String? phone,
    String? formalPhone,
    String? email,
    String? formalEmail,
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
    return InsuranceCompanyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      decription: decription ?? this.decription,
      username: username ?? this.username,
      logo: logo ?? this.logo,
      phone: phone ?? this.phone,
      formalPhone: formalPhone ?? this.formalPhone,
      email: email ?? this.email,
      formalEmail: formalEmail ?? this.formalEmail,
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
      'decription': decription,
      'name': name,
      'username': username,
      'logo': logo,
      'phone': phone,
      'formal_phone': formalPhone,
      'email': email,
      'formal_email': formalEmail,
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

  factory InsuranceCompanyModel.fromMap(Map<String, dynamic> map) {
    return InsuranceCompanyModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      decription: map['decription'] ?? '',
      username: map['username'] ?? '',
      logo: map['logo'],
      phone: map['phone'] ?? '',
      formalPhone: map['formal_phone'] ?? '',
      email: map['email'] ?? '',
      formalEmail: map['formal_email'] ?? '',
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

  factory InsuranceCompanyModel.fromJson(String source) =>
      InsuranceCompanyModel.fromMap(json.decode(source));

  @override
  List<Object?> get props {
    return [
      id,
      decription,
      name,
      username,
      logo,
      phone,
      formalPhone,
      email,
      formalEmail,
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

  @override
  String toString() {
    return 'InsuranceCompanyModel(id: $id, name: $name, decription: $decription, username: $username, logo: $logo, phone: $phone, formalPhone: $formalPhone, email: $email, formalEmail: $formalEmail, country: $country, adress1: $adress1, adress2: $adress2, state: $state, province: $province, zipCode: $zipCode, website: $website, facebook: $facebook, instgram: $instgram, snapchat: $snapchat, twitter: $twitter, youtube: $youtube, password: $password)';
  }
}
