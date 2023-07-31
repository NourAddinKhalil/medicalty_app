import 'package:medicalty/helpers/enums.dart';

class BloodTypesClass {
  final BloodTypesEnum id;
  final String name;
  BloodTypesClass({
    required this.id,
    required this.name,
  });
}

final bloodTypesList = [
  BloodTypesClass(
    id: BloodTypesEnum.aPlus,
    name: 'A+',
  ),
  BloodTypesClass(
    id: BloodTypesEnum.aMinus,
    name: 'A-',
  ),
  BloodTypesClass(
    id: BloodTypesEnum.bMinus,
    name: 'B+',
  ),
  BloodTypesClass(
    id: BloodTypesEnum.bMinus,
    name: 'B-',
  ),
  BloodTypesClass(
    id: BloodTypesEnum.oPlus,
    name: 'O+',
  ),
  BloodTypesClass(
    id: BloodTypesEnum.oMinus,
    name: 'O-',
  ),
  BloodTypesClass(
    id: BloodTypesEnum.abPlus,
    name: 'AB+',
  ),
  BloodTypesClass(
    id: BloodTypesEnum.abMinus,
    name: 'AB-',
  ),
];
