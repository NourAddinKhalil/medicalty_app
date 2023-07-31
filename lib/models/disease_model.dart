import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:medicalty/services/api/multipart_request_helpers.dart';

class DiseaseModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String? image;
  final List<String>? resultsImages;
  final List<String>? resultsVideos;

  static DiseaseModel get defaultModel {
    return const DiseaseModel(
      name: '',
      description: '',
    );
  }

  const DiseaseModel({
    this.id = -1,
    required this.name,
    required this.description,
    this.image,
    this.resultsImages,
    this.resultsVideos,
  });

  DiseaseModel copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    List<String>? resultsImages,
    List<String>? resultsVideos,
  }) {
    return DiseaseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      resultsImages: resultsImages ?? this.resultsImages,
      resultsVideos: resultsVideos ?? this.resultsVideos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image == null
          ? null
          : MultipartRequestHelpers.getMultipartFile(image!),
      'resultsImages': resultsImages
          ?.map((e) => MultipartRequestHelpers.getMultipartFile(e))
          .toList(),
      'resultsVideos': resultsVideos
          ?.map((e) => MultipartRequestHelpers.getMultipartFile(e))
          .toList(),
    };
  }

  factory DiseaseModel.fromMap(Map<String, dynamic> map) {
    return DiseaseModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'],
      resultsImages: List<String>.from(map['resultsImages']),
      resultsVideos: List<String>.from(map['resultsVideos']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DiseaseModel.fromJson(String source) =>
      DiseaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DiseaseModel(id: $id, name: $name, description: $description, image: $image, resultsImages: $resultsImages, resultsVideos: $resultsVideos)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      image,
      resultsImages,
      resultsVideos,
    ];
  }
}
