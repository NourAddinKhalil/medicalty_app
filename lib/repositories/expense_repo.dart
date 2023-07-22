import 'package:get/get.dart';
import 'package:medicalty/helpers/custom_exception.dart';
import 'package:medicalty/models/expense_model.dart';
import 'package:medicalty/repositories/request_structure.dart';
import 'package:medicalty/services/api/api_client.dart';
import 'package:medicalty/services/api/get_body_list.dart';

class ExpenseRepo extends GetxService with IRequestStructure {
  final ApiClient apiClient;

  ExpenseRepo({required this.apiClient});

  @override
  String get apiEndPoint => throw UnimplementedError();

  // @override
  // String get apiSearchEndpoint => throw UnimplementedError();

  @override
  Future<List<ExpenseModel>> search(query) async {
    try {
      final res = await apiClient.postData(apiSearchEndpoint, query);

      final list = GetBodyList.convertBodyToList<ExpenseModel>(
        res.body['data'],
        (element) {
          return ExpenseModel.fromMap(element);
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
  Future<List<ExpenseModel>> get() async {
    try {
      final res = await apiClient.getData(apiEndPoint);

      final list = GetBodyList.convertBodyToList<ExpenseModel>(
        res.body['data'],
        (element) {
          return ExpenseModel.fromMap(element);
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
  Future<ExpenseModel> getSingle(id) async {
    try {
      final res = await apiClient.getData('$apiEndPoint/$id');

      final resBody = res.body['data'] as Map<String, dynamic>;
      var employeeModel = ExpenseModel.defaultModel;
      employeeModel = ExpenseModel.fromMap(resBody);

      return employeeModel;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<ExpenseModel> add(model) async {
    try {
      model = model as ExpenseModel;
      var formData = FormData(model.toMap());

      final res = await apiClient.postData(apiEndPoint, formData);
      final mod = ExpenseModel.fromMap(res.body['data']);
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
      model = model as ExpenseModel;
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
  Future<ExpenseModel> edit(model) async {
    try {
      model = model as ExpenseModel;
      var formData = FormData(model.toMap());
      final res = await apiClient.putData(apiEndPoint, formData);
      final mod = ExpenseModel.fromMap(res.body['data']);
      return mod;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }
}
