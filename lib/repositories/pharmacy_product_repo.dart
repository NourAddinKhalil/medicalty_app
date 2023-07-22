import 'package:get/get.dart';
import 'package:medicalty/helpers/custom_exception.dart';
import 'package:medicalty/models/pharmacy_product_model.dart';
import 'package:medicalty/repositories/request_structure.dart';
import 'package:medicalty/services/api/api_client.dart';
import 'package:medicalty/services/api/get_body_list.dart';

class PharmacyProductRepo extends GetxService with IRequestStructure {
  final ApiClient apiClient;

  PharmacyProductRepo({required this.apiClient});

  @override
  String get apiEndPoint => throw UnimplementedError();

  // @override
  // String get apiSearchEndpoint => throw UnimplementedError();

  @override
  Future<List<PharmacyProductModel>> search(query) async {
    try {
      final res = await apiClient.postData(apiSearchEndpoint, query);

      final list = GetBodyList.convertBodyToList<PharmacyProductModel>(
        res.body['data'],
        (element) {
          return PharmacyProductModel.fromMap(element);
        },
      );

      return list;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<List<PharmacyProductModel>> get() async {
    try {
      final res = await apiClient.getData(apiEndPoint);

      final list = GetBodyList.convertBodyToList<PharmacyProductModel>(
        res.body['data'],
        (element) {
          return PharmacyProductModel.fromMap(element);
        },
      );

      return list;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<PharmacyProductModel> getSingle(id) async {
    try {
      final res = await apiClient.getData('$apiEndPoint/$id');

      final resBody = res.body['data'] as Map<String, dynamic>;
      var employeeModel = PharmacyProductModel.defaultModel;
      employeeModel = PharmacyProductModel.fromMap(resBody);

      return employeeModel;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<PharmacyProductModel> add(model) async {
    try {
      model = model as PharmacyProductModel;
      var formData = FormData(model.toMap());

      final res = await apiClient.postData(apiEndPoint, formData);
      final mod = PharmacyProductModel.fromMap(res.body['data']);
      return mod;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<bool> delete(model) async {
    try {
      model = model as PharmacyProductModel;
      final res = await apiClient.deleteData('$apiEndPoint/${model.id}');
      if (res.isOk) {
        return true;
      } else {
        return false;
      }
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<PharmacyProductModel> edit(model) async {
    try {
      model = model as PharmacyProductModel;
      var formData = FormData(model.toMap());
      final res = await apiClient.putData(apiEndPoint, formData);
      final mod = PharmacyProductModel.fromMap(res.body['data']);
      return mod;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }
}
