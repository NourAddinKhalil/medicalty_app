import 'package:medicalty/helpers/custom_exception.dart';
import 'package:medicalty/helpers/custom_overlay_loading.dart';
import 'package:medicalty/helpers/show_messages.dart';
import 'package:medicalty/repositories/request_structure.dart';
import 'package:medicalty/controllers/helpers_controller.dart';

class MasterController extends HelpersController with IRequestStructure {
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
  Future search(query) async {}
}
