import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/api_controllers/connection_controller.dart';

/// This controller is helper for the other controllers
/// to get loading status or online status or auth status
class HelpersController extends GetxController {
  var _isLoading = false;

  bool get isLoading => _isLoading;

  bool get isOnline => Get.find<ConnectionController>().isOnline;

  // bool get isAuth => Get.find<AuthController>().authenticated;

  set isLoading(bool loading) {
    _isLoading = loading;
    update();
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      super.update(ids, condition);
    });
  }
}
