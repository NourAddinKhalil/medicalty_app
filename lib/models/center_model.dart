import 'dart:convert';

import 'package:equatable/equatable.dart';

class CenterModel extends Equatable {
  final int id;
  final String name;
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
  final String subscriptionType;
  final String subscriptionPeriod;
  final String? password;

  static CenterModel get defaultModel {
    return const CenterModel(
      name: '',
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
      subscriptionType: '',
      subscriptionPeriod: '',
    );
  }

  const CenterModel({
    this.id = -1,
    required this.name,
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
    required this.subscriptionType,
    required this.subscriptionPeriod,
    this.password,
  });

  CenterModel copyWith({
    int? id,
    String? name,
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
    String? subscriptionType,
    String? subscriptionPeriod,
    String? password,
  }) {
    return CenterModel(
      id: id ?? this.id,
      name: name ?? this.name,
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
      subscriptionType: subscriptionType ?? this.subscriptionType,
      subscriptionPeriod: subscriptionPeriod ?? this.subscriptionPeriod,
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
      'subscription_type': subscriptionType,
      'subscription_period': subscriptionPeriod,
      'password': password,
    };
  }

  factory CenterModel.fromMap(Map<String, dynamic> map) {
    return CenterModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
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
      subscriptionType: map['subscription_type'] ?? '',
      subscriptionPeriod: map['subscription_period'] ?? '',
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CenterModel.fromJson(String source) =>
      CenterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CenterModel(id: $id, name: $name, username: $username, logo: $logo, phone: $phone, formalPhone: $formalPhone, email: $email, formalEmail: $formalEmail, country: $country, adress1: $adress1, adress2: $adress2, state: $state, province: $province, zipCode: $zipCode, website: $website, facebook: $facebook, instgram: $instgram, snapchat: $snapchat, twitter: $twitter, youtube: $youtube, subscriptionType: $subscriptionType, subscriptionPeriod: $subscriptionPeriod, password: $password)';
  }

  @override
  List<Object?> get props {
    return [
      id,
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
      subscriptionType,
      subscriptionPeriod,
      password,
    ];
  }
}
