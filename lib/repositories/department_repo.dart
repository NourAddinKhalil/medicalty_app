import 'package:get/get.dart';
import 'package:medicalty/helpers/custom_exception.dart';
import 'package:medicalty/models/department_model.dart';
import 'package:medicalty/repositories/request_structure.dart';
import 'package:medicalty/services/api/api_client.dart';
import 'package:medicalty/services/api/get_body_list.dart';

class DepartmentRepo extends GetxService with IRequestStructure {
  final ApiClient apiClient;

  DepartmentRepo({required this.apiClient});

  @override
  String get apiEndPoint => throw UnimplementedError();

  // @override
  // String get apiSearchEndpoint => throw UnimplementedError();

  @override
  Future<List<DepartmentModel>> search(query) async {
    try {
      final res = await apiClient.postData(apiSearchEndpoint, query);

      final list = GetBodyList.convertBodyToList<DepartmentModel>(
        res.body['data'],
        (element) {
          return DepartmentModel.fromMap(element);
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
  Future<List<DepartmentModel>> get() async {
    try {
      final res = await apiClient.getData(apiEndPoint);

      final list = GetBodyList.convertBodyToList<DepartmentModel>(
        res.body['data'],
        (element) {
          return DepartmentModel.fromMap(element);
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
  Future<DepartmentModel> getSingle(id) async {
    try {
      final res = await apiClient.getData('$apiEndPoint/$id');

      final resBody = res.body['data'] as Map<String, dynamic>;
      var employeeModel = DepartmentModel.defaultModel;
      employeeModel = DepartmentModel.fromMap(resBody);

      return employeeModel;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<DepartmentModel> add(model) async {
    try {
      model = model as DepartmentModel;
      var formData = FormData(model.toMap());

      final res = await apiClient.postData(apiEndPoint, formData);
      final mod = DepartmentModel.fromMap(res.body['data']);
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
      model = model as DepartmentModel;
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
  Future<DepartmentModel> edit(model) async {
    try {
      model = model as DepartmentModel;
      var formData = FormData(model.toMap());
      final res = await apiClient.putData(apiEndPoint, formData);
      final mod = DepartmentModel.fromMap(res.body['data']);
      return mod;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }
}
