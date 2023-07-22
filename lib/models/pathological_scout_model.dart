import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:medicalty/services/api/multipart_request_helpers.dart';

class PathologicalScoutModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final double amount;
  final String? image;

  static PathologicalScoutModel get defaultModel {
    return const PathologicalScoutModel(
      name: '',
      description: '',
      amount: -1,
    );
  }

  const PathologicalScoutModel({
    this.id = -1,
    required this.name,
    required this.description,
    required this.amount,
    this.image,
  });

  PathologicalScoutModel copyWith({
    int? id,
    String? name,
    String? description,
    double? amount,
    String? image,
  }) {
    return PathologicalScoutModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'amount': amount,
      'image': image == null
          ? null
          : MultipartRequestHelpers.getMultipartFile(image!),
    };
  }

  factory PathologicalScoutModel.fromMap(Map<String, dynamic> map) {
    return PathologicalScoutModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PathologicalScoutModel.fromJson(String source) =>
      PathologicalScoutModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PathologicalScoutModel(id: $id, name: $name, description: $description, amount: $amount, image: $image)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      amount,
      image,
    ];
  }
}
