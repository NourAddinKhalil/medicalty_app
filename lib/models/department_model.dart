import 'dart:convert';

import 'package:equatable/equatable.dart';

class DepartmentModel extends Equatable {
  final int id;
  final String name;
  final String image;
  final String description;

  static DepartmentModel get defaultModel {
    return const DepartmentModel(
      name: '',
      image: '',
      description: '',
    );
  }

  const DepartmentModel({
    this.id = -1,
    required this.name,
    required this.image,
    required this.description,
  });

  DepartmentModel copyWith({
    int? id,
    String? name,
    String? image,
    String? description,
  }) {
    return DepartmentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
    };
  }

  factory DepartmentModel.fromMap(Map<String, dynamic> map) {
    return DepartmentModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DepartmentModel.fromJson(String source) =>
      DepartmentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DepartmentModel(id: $id, name: $name, image: $image, description: $description)';
  }

  @override
  List<Object> get props => [id, name, image, description];
}
