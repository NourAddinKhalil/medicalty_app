import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:medicalty/helpers/convert_to_date_time.dart';
import 'package:medicalty/services/api/multipart_request_helpers.dart';

class ExperienceModel extends Equatable {
  final int id;
  final int doctorId;
  final String name;
  final String placeName;
  final String placeCountry;
  final DateTime start;
  final DateTime end;
  final bool still;
  final String? image;

  static ExperienceModel get defaultModel {
    return ExperienceModel(
      name: '',
      doctorId: -1,
      placeName: '',
      placeCountry: '',
      start: DateTime(1999),
      end: DateTime(1999),
      still: false,
    );
  }

  const ExperienceModel({
    this.id = -1,
    required this.name,
    required this.doctorId,
    required this.placeName,
    required this.placeCountry,
    required this.start,
    required this.end,
    required this.still,
    this.image,
  });

  ExperienceModel copyWith({
    int? id,
    String? name,
    int? doctorId,
    String? placeName,
    String? placeCountry,
    DateTime? start,
    DateTime? end,
    bool? still,
    String? image,
  }) {
    return ExperienceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      doctorId: doctorId ?? this.doctorId,
      placeName: placeName ?? this.placeName,
      placeCountry: placeCountry ?? this.placeCountry,
      start: start ?? this.start,
      end: end ?? this.end,
      still: still ?? this.still,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'doctorId': doctorId,
      'placeName': placeName,
      'placeCountry': placeCountry,
      'start': DateTimeHelpers.convertDateToString(start),
      'end': DateTimeHelpers.convertDateToString(end),
      'still': still,
      'image': image == null
          ? null
          : MultipartRequestHelpers.getMultipartFile(image!),
    };
  }

  factory ExperienceModel.fromMap(Map<String, dynamic> map) {
    return ExperienceModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      doctorId: map['doctorId']?.toInt() ?? 0,
      placeName: map['placeName'] ?? '',
      placeCountry: map['placeCountry'] ?? '',
      start: DateTime.fromMillisecondsSinceEpoch(map['start']),
      end: DateTime.fromMillisecondsSinceEpoch(map['end']),
      still: map['still'] ?? false,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ExperienceModel.fromJson(String source) =>
      ExperienceModel.fromMap(json.decode(source));

  @override
  List<Object?> get props {
    return [
      id,
      name,
      doctorId,
      placeName,
      placeCountry,
      start,
      end,
      still,
      image,
    ];
  }

  @override
  String toString() {
    return 'ExperienceModel(id: $id, doctorId: $doctorId, name: $name, placeName: $placeName, placeCountry: $placeCountry, start: $start, end: $end, still: $still, image: $image)';
  }
}
