import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import 'package:medicalty/helpers/enums.dart';
import 'package:medicalty/services/api/multipart_request_helpers.dart';

class InvoiceModel extends Equatable {
  final int id;
  final int payFor;
  final String invoiceAddress;
  final DateTime dueDate;
  final PaymentTypeEnum dueAmontType;
  final double dueAmont;
  final String accountingCode;
  final String customerAddress;
  final double subtotal;
  final double discount;
  final double tax;
  final double deposite;
  final double total;
  final String message;
  final String image;

  static InvoiceModel get defaultModel {
    return InvoiceModel(
      payFor: -1,
      invoiceAddress: '',
      dueAmont: 0.00,
      dueDate: DateTime(1999),
      dueAmontType: PaymentTypeEnum.net25,
      accountingCode: '',
      customerAddress: '',
      subtotal: -1,
      discount: -1,
      tax: -1,
      deposite: -1,
      total: -1,
      message: '',
      image: '',
    );
  }

  const InvoiceModel({
    this.id = -1,
    required this.payFor,
    required this.invoiceAddress,
    required this.dueAmont,
    required this.dueDate,
    required this.dueAmontType,
    required this.accountingCode,
    required this.customerAddress,
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.deposite,
    required this.total,
    required this.message,
    required this.image,
  });

  InvoiceModel copyWith({
    int? id,
    int? payFor,
    String? invoiceAddress,
    DateTime? dueDate,
    PaymentTypeEnum? dueAmontType,
    double? dueAmont,
    String? accountingCode,
    String? customerAddress,
    double? subtotal,
    double? discount,
    double? tax,
    double? deposite,
    double? total,
    String? message,
    String? image,
  }) {
    return InvoiceModel(
      id: id ?? this.id,
      payFor: payFor ?? this.payFor,
      invoiceAddress: invoiceAddress ?? this.invoiceAddress,
      dueDate: dueDate ?? this.dueDate,
      dueAmontType: dueAmontType ?? this.dueAmontType,
      dueAmont: dueAmont ?? this.dueAmont,
      accountingCode: accountingCode ?? this.accountingCode,
      customerAddress: customerAddress ?? this.customerAddress,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      tax: tax ?? this.tax,
      deposite: deposite ?? this.deposite,
      total: total ?? this.total,
      message: message ?? this.message,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'payFor': payFor,
      'invoiceAddress': invoiceAddress,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'dueAmontType': dueAmontType.name,
      'dueAmont': dueAmont,
      'accountingCode': accountingCode,
      'customerAddress': customerAddress,
      'subtotal': subtotal,
      'discount': discount,
      'tax': tax,
      'deposite': deposite,
      'total': total,
      'message': message,
      'image': MultipartRequestHelpers.getMultipartFile(image),
    };
  }

  factory InvoiceModel.fromMap(Map<String, dynamic> map) {
    return InvoiceModel(
      id: map['id']?.toInt() ?? 0,
      payFor: map['payFor']?.toInt() ?? 0,
      invoiceAddress: map['invoiceAddress'] ?? '',
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate']),
      dueAmont: map['dueAmont']?.toDouble() ?? 0.0,
      dueAmontType: PaymentTypeEnum.values.firstWhereOrNull(
            (element) {
              return element.name == map['dueAmontType'];
            },
          ) ??
          PaymentTypeEnum.net20,
      accountingCode: map['accountingCode'] ?? '',
      customerAddress: map['customerAddress'] ?? '',
      subtotal: map['subtotal']?.toDouble() ?? 0.0,
      discount: map['discount']?.toDouble() ?? 0.0,
      tax: map['tax']?.toDouble() ?? 0.0,
      deposite: map['deposite']?.toDouble() ?? 0.0,
      total: map['total']?.toDouble() ?? 0.0,
      message: map['message'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceModel.fromJson(String source) =>
      InvoiceModel.fromMap(json.decode(source));

  @override
  List<Object> get props {
    return [
      id,
      payFor,
      dueAmont,
      invoiceAddress,
      dueDate,
      dueAmontType,
      accountingCode,
      customerAddress,
      subtotal,
      discount,
      tax,
      deposite,
      total,
      message,
      image,
    ];
  }

  @override
  String toString() {
    return 'InvoiceModel(id: $id, payFor: $payFor, invoiceAddress: $invoiceAddress, dueDate: $dueDate, dueAmontType: $dueAmontType, dueAmont: $dueAmont, accountingCode: $accountingCode, customerAddress: $customerAddress, subtotal: $subtotal, discount: $discount, tax: $tax, deposite: $deposite, total: $total, message: $message, image: $image)';
  }
}
