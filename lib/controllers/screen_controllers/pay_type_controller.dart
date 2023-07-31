import 'package:get/get.dart';
import 'package:medicalty/helpers/enums.dart';

class PayTypeController extends GetxController {
  var _isMoney = true;
  var _isRatio = false;
  var type = MoneyTypeEnum.fixed;

  bool get isMoney => _isMoney;
  bool get isRatio => _isRatio;

  PayTypeController([MoneyTypeEnum type = MoneyTypeEnum.fixed]) {
    changeType(type);
  }

  void changeType(MoneyTypeEnum type) {
    final cond = type != this.type;
    if (cond) {
      this.type = type;
      isMoney = cond;
      isRatio = cond;
    }
  }

  set isMoney(bool value) {
    if (value != _isMoney) {
      // value = _isRatio == value;
      _isMoney = true;
      _isRatio = false;
      type = MoneyTypeEnum.fixed;
      update(['payment_type']);
    }
  }

  set isRatio(bool value) {
    if (value != _isRatio) {
      _isRatio = true;
      _isMoney = false;
      type = MoneyTypeEnum.ratio;
      update(['payment_type']);
    }
  }

  String get typeSymbol {
    return isMoney ? '\$' : '%';
  }
}
