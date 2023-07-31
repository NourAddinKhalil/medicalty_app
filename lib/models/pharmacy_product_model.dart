import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:medicalty/services/api/multipart_request_helpers.dart';

class PharmacyProductModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String inforamtion;
  final double price;
  final String? image;
  final List<String>? pictures;

  static PharmacyProductModel get defaultModel {
    return const PharmacyProductModel(
      name: '',
      description: '',
      inforamtion: '',
      price: -1,
    );
  }

  const PharmacyProductModel({
    this.id = -1,
    required this.name,
    required this.description,
    required this.inforamtion,
    required this.price,
    this.image,
    this.pictures,
  });

  PharmacyProductModel copyWith({
    int? id,
    String? name,
    String? description,
    String? inforamtion,
    double? price,
    String? image,
    List<String>? pictures,
  }) {
    return PharmacyProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      inforamtion: inforamtion ?? this.inforamtion,
      price: price ?? this.price,
      image: image ?? this.image,
      pictures: pictures ?? this.pictures,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'inforamtion': inforamtion,
      'price': price,
      'image': image == null
          ? null
          : MultipartRequestHelpers.getMultipartFile(image!),
      'pictures': pictures
          ?.map((e) => MultipartRequestHelpers.getMultipartFile(e))
          .toList(),
    };
  }

  factory PharmacyProductModel.fromMap(Map<String, dynamic> map) {
    return PharmacyProductModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      inforamtion: map['inforamtion'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'],
      pictures: List<String>.from(map['pictures']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PharmacyProductModel.fromJson(String source) =>
      PharmacyProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PharmacyProductModel(id: $id, name: $name, decription: $description, inforamtion: $inforamtion, price: $price, image: $image, pictures: $pictures)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      inforamtion,
      price,
      image,
      pictures,
    ];
  }
}
