import 'package:medicalty/helpers/enums.dart';

class PaymentTypesClass {
  final PaymentTypeEnum id;
  final String name;
  final double payRatio;
  final String dbName;
  PaymentTypesClass({
    required this.id,
    required this.name,
    required this.payRatio,
    required this.dbName,
  });
}

final paymentTypesList = [
  PaymentTypesClass(
    id: PaymentTypeEnum.net10,
    name: 'Net 10',
    payRatio: 0.10,
    dbName: 'Net 10',
  ),
  PaymentTypesClass(
    id: PaymentTypeEnum.net20,
    name: 'Net 20',
    payRatio: 0.20,
    dbName: 'Net 20',
  ),
  PaymentTypesClass(
    id: PaymentTypeEnum.net25,
    name: 'Net 25',
    payRatio: 0.25,
    dbName: 'Net 25',
  ),
  PaymentTypesClass(
    id: PaymentTypeEnum.net30,
    name: 'Net 30',
    payRatio: 0.30,
    dbName: 'Net 30',
  ),
  PaymentTypesClass(
    id: PaymentTypeEnum.net40,
    name: 'Net 40',
    payRatio: 0.40,
    dbName: 'Net 40',
  ),
  PaymentTypesClass(
    id: PaymentTypeEnum.net45,
    name: 'Net 45',
    payRatio: 0.45,
    dbName: 'Net 45',
  ),
  PaymentTypesClass(
    id: PaymentTypeEnum.net50,
    name: 'Net 50',
    payRatio: 0.50,
    dbName: 'Net 50',
  ),
  PaymentTypesClass(
    id: PaymentTypeEnum.net60,
    name: 'Net 60',
    payRatio: 0.60,
    dbName: 'Net 60',
  ),
  PaymentTypesClass(
    id: PaymentTypeEnum.custom,
    name: 'Custom',
    payRatio: 0.00,
    dbName: 'Custom',
  ),
];
