import 'package:get/get.dart';
import 'package:medicalty/helpers/show_messages.dart';

class ApiChecker {
  static void checkResponse(Response response) {
    if (response.statusCode == 401) {
      // Get.offAllNamed(AppRouter.loginRoute);
    } else {
      ShowAnyMessages.showSnackBar(
        response.statusText ?? 'Error',
        isError: true,
      );
    }
  }
}
