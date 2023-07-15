import 'package:get/get.dart';
import 'package:medicalty/controllers/api_controllers/connection_controller.dart';
import 'package:medicalty/helpers/custom_exception.dart';
import 'package:medicalty/helpers/custom_overlay_loading.dart';
import 'package:medicalty/helpers/show_messages.dart';
import 'package:medicalty/repositories/request_structure.dart';

class MasterController extends GetxController implements IRequestStructure {
  var _isLoading = false;

  bool get isLoading => _isLoading;

  bool get isOnline => Get.find<ConnectionController>().isOnline;

  // bool get isAuth => Get.find<AuthController>().authenticated;

  Future<void> save<Model>(Model model, {bool isUpdate = false}) async {
    //show loading spinner
    CustomOverlayLoading.showOverlayLoading();
    isLoading = true;
    try {
      if (!isOnline) {
        throw CustomException('not-online');
      }
      if (isUpdate) {
        await edit(model);
      } else {
        await add(model);
      }
      CustomOverlayLoading.hideOverlayLoading();
      ShowAnyMessages.showSnackBar('Operation Completed Successfully',
          isSuccess: true);
    } on CustomException catch (e) {
      CustomOverlayLoading.hideOverlayLoading();
      isLoading = false;
      ShowAnyMessages.showSnackBar(e.errorMessage, isError: true);
    } finally {
      isLoading = false;
    }
  }

  void remove<Model>(Model model) async {
    //show loading spinner
    CustomOverlayLoading.showOverlayLoading();
    isLoading = true;
    try {
      if (!isOnline) {
        throw CustomException('not-online');
      }
      await delete(model);
      CustomOverlayLoading.hideOverlayLoading();
      ShowAnyMessages.showSnackBar('Operation Completed Successfully',
          isSuccess: true);
    } on CustomException catch (e) {
      CustomOverlayLoading.hideOverlayLoading();
      isLoading = false;
      ShowAnyMessages.showSnackBar(e.errorMessage, isError: true);
    } finally {
      isLoading = false;
    }
  }

  set isLoading(bool loading) {
    _isLoading = loading;
    update();
  }

  @override
  Future<void> delete(model) async {}

  @override
  Future get() async {}

  @override
  Future getSingle(id) async {}

  @override
  Future<void> add(model) async {}

  @override
  Future<void> edit(model) async {}

  @override
  String get apiEndPoint => throw UnimplementedError();

  @override
  String get apiSearchEndpoint => throw UnimplementedError();

  @override
  Future search(query) async {}
}
