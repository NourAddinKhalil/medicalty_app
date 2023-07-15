import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:medicalty/services/api/api_client.dart';
import 'package:medicalty/services/app_info.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() async {
    await AppInfo.getPackageInfo();
    // final sharedPreferences = await SharedPreferences.getInstance();
    const secureStorage = FlutterSecureStorage();
    Get.lazyPut(() => ApiClient(secureStorage: secureStorage), fenix: true);
  }
}
