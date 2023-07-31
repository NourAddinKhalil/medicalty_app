import 'dart:convert';

import 'package:equatable/equatable.dart';

class LabModel extends Equatable {
  final int id;
  final String name;
  final String image;
  final String username;
  final String address;
  final String country;
  final String phone;
  final String email;
  final String website;
  final String password;

  static LabModel get defaultModel {
    return const LabModel(
      name: '',
      image: '',
      username: '',
      address: '',
      country: '',
      phone: '',
      email: '',
      website: '',
      password: '',
    );
  }

  const LabModel({
    this.id = -1,
    required this.name,
    required this.image,
    required this.username,
    required this.address,
    required this.country,
    required this.phone,
    required this.email,
    required this.website,
    required this.password,
  });

  LabModel copyWith({
    int? id,
    String? name,
    String? image,
    String? username,
    String? address,
    String? country,
    String? phone,
    String? email,
    String? website,
    String? password,
  }) {
    return LabModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      username: username ?? this.username,
      address: address ?? this.address,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      website: website ?? this.website,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'username': username,
      'address': address,
      'country': country,
      'phone': phone,
      'email': email,
      'website': website,
      'password': password,
    };
  }

  factory LabModel.fromMap(Map<String, dynamic> map) {
    return LabModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      username: map['username'] ?? '',
      address: map['address'] ?? '',
      country: map['country'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      website: map['website'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LabModel.fromJson(String source) =>
      LabModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LabModel(id: $id, name: $name, image: $image, username: $username, address: $address, country: $country, phone: $phone, email: $email, website: $website, password: $password)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      image,
      username,
      address,
      country,
      phone,
      email,
      website,
      password,
    ];
  }
}
