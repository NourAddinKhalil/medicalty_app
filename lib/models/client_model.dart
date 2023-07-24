import 'dart:convert';

import 'package:equatable/equatable.dart';

class ClientModel extends Equatable {
  final int id;
  final String nameDescription;
  final String firstName;
  final String lastName;
  final String? image;
  final String companyName;
  final String phone;
  final String phoneDescription;
  final String email;
  final String emailDescription;
  final String address;
  final String? address2;
  final String country;
  final String city;
  final String? province;
  final String? zipCode;
  final String? website;

  static ClientModel get defaultModel {
    return const ClientModel(
      nameDescription: '',
      firstName: '',
      lastName: '',
      companyName: '',
      phone: '',
      phoneDescription: '',
      email: '',
      emailDescription: '',
      address: '',
      country: '',
      city: '',
    );
  }

  const ClientModel({
    this.id = -1,
    required this.nameDescription,
    required this.firstName,
    required this.lastName,
    this.image,
    required this.companyName,
    required this.phone,
    required this.phoneDescription,
    required this.email,
    required this.emailDescription,
    required this.address,
    this.address2,
    required this.country,
    required this.city,
    this.province,
    this.zipCode,
    this.website,
  });

  ClientModel copyWith({
    int? id,
    String? nameDescription,
    String? firstName,
    String? lastName,
    String? image,
    String? companyName,
    String? phone,
    String? phoneDescription,
    String? email,
    String? emailDescription,
    String? address,
    String? address2,
    String? country,
    String? city,
    String? province,
    String? zipCode,
    String? website,
  }) {
    return ClientModel(
      id: id ?? this.id,
      nameDescription: nameDescription ?? this.nameDescription,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      companyName: companyName ?? this.companyName,
      phone: phone ?? this.phone,
      phoneDescription: phoneDescription ?? this.phoneDescription,
      email: email ?? this.email,
      emailDescription: emailDescription ?? this.emailDescription,
      address: address ?? this.address,
      address2: address2 ?? this.address2,
      country: country ?? this.country,
      city: city ?? this.city,
      province: province ?? this.province,
      zipCode: zipCode ?? this.zipCode,
      website: website ?? this.website,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_description': nameDescription,
      'first_name': firstName,
      'last_name': lastName,
      'image': image,
      'company_name': companyName,
      'phone': phone,
      'phone_description': phoneDescription,
      'email': email,
      'email_description': emailDescription,
      'address': address,
      'address2': address2,
      'country': country,
      'city': city,
      'province': province,
      'zip_code': zipCode,
      'web_site': website,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id']?.toInt() ?? 0,
      nameDescription: map['name_description'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      image: map['image'],
      companyName: map['company_name'] ?? '',
      phone: map['phone'] ?? '',
      phoneDescription: map['phone_description'] ?? '',
      email: map['email'] ?? '',
      emailDescription: map['email_description'] ?? '',
      address: map['address'] ?? '',
      address2: map['address2'],
      country: map['country'] ?? '',
      city: map['city'] ?? '',
      province: map['province'],
      zipCode: map['zip_code'],
      website: map['web_site'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source));

  @override
  List<Object?> get props {
    return [
      id,
      nameDescription,
      firstName,
      lastName,
      image,
      companyName,
      phone,
      phoneDescription,
      email,
      emailDescription,
      address,
      address2,
      country,
      city,
      province,
      zipCode,
      website,
    ];
  }

  @override
  String toString() {
    return 'ClientModel(id: $id, nameDescription: $nameDescription, firstName: $firstName, lastName: $lastName, image: $image, companyName: $companyName, phone: $phone, phoneDescription: $phoneDescription, email: $email, emailDescription: $emailDescription, address: $address, address2: $address2, country: $country, city: $city, province: $province, zipCode: $zipCode, website: $website)';
  }
}
