import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/helpers/enums.dart';

class MoneyScreenController extends GetxController {
  final amountTxtController = TextEditingController();
  late MoneyTypeEnum moneyType;
  final String title;
  final bool onlyOneType;
  final MoneyTypeEnum? type;

  MoneyScreenController(
    this.title, {
    this.onlyOneType = false,
    this.type,
  }) {
    moneyType = type ?? MoneyTypeEnum.fixed;
  }

  double get getAmount {
    final val = double.tryParse(amountTxtController.text) ?? 0.00;
    if (moneyType == MoneyTypeEnum.ratio) {
      return val / 100;
    }
    return val;
  }

  @override
  void dispose() {
    amountTxtController.dispose();
    super.dispose();
  }
}
