import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import 'package:medicalty/helpers/enums.dart';
import 'package:medicalty/services/api/multipart_request_helpers.dart';

class ProductModel extends Equatable {
  final int id;
  final ProductsTypeEnum type;
  final String name;
  final String decription;
  final double price;
  final int quantity;
  final String? image;

  static ProductModel get defaultModel {
    return const ProductModel(
      type: ProductsTypeEnum.product,
      name: '',
      decription: '',
      price: -1,
      quantity: -1,
    );
  }

  const ProductModel({
    this.id = -1,
    required this.type,
    required this.name,
    required this.decription,
    required this.price,
    required this.quantity,
    this.image,
  });

  ProductModel copyWith({
    int? id,
    ProductsTypeEnum? type,
    String? name,
    String? decription,
    double? price,
    int? quantity,
    String? image,
  }) {
    return ProductModel(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      decription: decription ?? this.decription,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.name,
      'name': name,
      'decription': decription,
      'price': price,
      'quantity': quantity,
      'image': image == null
          ? null
          : MultipartRequestHelpers.getMultipartFile(image!),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      type: ProductsTypeEnum.values.firstWhereOrNull((element) {
            return element.name == map['type'];
          }) ??
          ProductsTypeEnum.product,
      name: map['name'] ?? '',
      decription: map['decription'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, type: $type, name: $name, decription: $decription, price: $price, quantity: $quantity, image: $image)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      type,
      name,
      decription,
      price,
      quantity,
      image,
    ];
  }
}
