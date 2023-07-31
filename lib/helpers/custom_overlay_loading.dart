import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CustomOverlayLoading {
  static void showOverlayLoading() {
    // final context = Get.find<AppRouter>().navigatorKey.currentContext!;
    final context = Get.context!;
    context.loaderOverlay.show();
  }

  static bool isLoading() {
    // final context = Get.find<AppRouter>().navigatorKey.currentContext!;
    final context = Get.context!;
    return context.loaderOverlay.visible;
  }

  static void hideOverlayLoading() {
    // final context = Get.find<AppRouter>().navigatorKey.currentContext!;
    final context = Get.context!;
    final isvisible = context.loaderOverlay.visible;
    if (isvisible) {
      context.loaderOverlay.hide();
    }
  }
}
