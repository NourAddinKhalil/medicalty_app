import 'package:get/get.dart';
import 'package:medicalty/helpers/custom_exception.dart';
import 'package:medicalty/models/product_model.dart';
import 'package:medicalty/repositories/request_structure.dart';
import 'package:medicalty/services/api/api_client.dart';
import 'package:medicalty/services/api/get_body_list.dart';

class ProductRepo extends GetxService with IRequestStructure {
  final ApiClient apiClient;

  ProductRepo({required this.apiClient});

  @override
  String get apiEndPoint => throw UnimplementedError();

  // @override
  // String get apiSearchEndpoint => throw UnimplementedError();

  @override
  Future<List<ProductModel>> search(query) async {
    try {
      final res = await apiClient.postData(apiSearchEndpoint, query);

      final list = GetBodyList.convertBodyToList<ProductModel>(
        res.body['data'],
        (element) {
          return ProductModel.fromMap(element);
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
  Future<List<ProductModel>> get() async {
    try {
      final res = await apiClient.getData(apiEndPoint);

      final list = GetBodyList.convertBodyToList<ProductModel>(
        res.body['data'],
        (element) {
          return ProductModel.fromMap(element);
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
  Future<ProductModel> getSingle(id) async {
    try {
      final res = await apiClient.getData('$apiEndPoint/$id');

      final resBody = res.body['data'] as Map<String, dynamic>;
      var employeeModel = ProductModel.defaultModel;
      employeeModel = ProductModel.fromMap(resBody);

      return employeeModel;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<ProductModel> add(model) async {
    try {
      model = model as ProductModel;
      var formData = FormData(model.toMap());

      final res = await apiClient.postData(apiEndPoint, formData);
      final mod = ProductModel.fromMap(res.body['data']);
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
      model = model as ProductModel;
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
  Future<ProductModel> edit(model) async {
    try {
      model = model as ProductModel;
      var formData = FormData(model.toMap());
      final res = await apiClient.putData(apiEndPoint, formData);
      final mod = ProductModel.fromMap(res.body['data']);
      return mod;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }
}
