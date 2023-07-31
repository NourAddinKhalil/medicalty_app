import 'package:get/get.dart';

class UnitsOfMeasureController extends GetxController {
  String defaultSelected = "Metric";
  String get selected => defaultSelected;
  void selectButton(String type) {
    defaultSelected = type;
    update();
  }
}
