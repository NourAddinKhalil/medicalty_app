import 'package:get/get.dart';
import 'package:medicalty/helpers/custom_exception.dart';
import 'package:medicalty/models/client_model.dart';
import 'package:medicalty/repositories/request_structure.dart';
import 'package:medicalty/services/api/api_client.dart';
import 'package:medicalty/services/api/get_body_list.dart';

class ClientRepo extends GetxService with IRequestStructure {
  final ApiClient apiClient;

  ClientRepo({required this.apiClient});

  @override
  String get apiEndPoint => throw UnimplementedError();

  // @override
  // String get apiSearchEndpoint => throw UnimplementedError();

  @override
  Future<List<ClientModel>> search(query) async {
    try {
      final res = await apiClient.postData(apiSearchEndpoint, query);

      final list = GetBodyList.convertBodyToList<ClientModel>(
        res.body['data'],
        (element) {
          return ClientModel.fromMap(element);
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
  Future<List<ClientModel>> get() async {
    try {
      final res = await apiClient.getData(apiEndPoint);

      final list = GetBodyList.convertBodyToList<ClientModel>(
        res.body['data'],
        (element) {
          return ClientModel.fromMap(element);
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
  Future<ClientModel> getSingle(id) async {
    try {
      final res = await apiClient.getData('$apiEndPoint/$id');

      final resBody = res.body['data'] as Map<String, dynamic>;
      var employeeModel = ClientModel.defaultModel;
      employeeModel = ClientModel.fromMap(resBody);

      return employeeModel;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<ClientModel> add(model) async {
    try {
      model = model as ClientModel;
      var formData = FormData(model.toMap());

      final res = await apiClient.postData(apiEndPoint, formData);
      final mod = ClientModel.fromMap(res.body['data']);
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
      model = model as ClientModel;
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
  Future<ClientModel> edit(model) async {
    try {
      model = model as ClientModel;
      var formData = FormData(model.toMap());
      final res = await apiClient.putData(apiEndPoint, formData);
      final mod = ClientModel.fromMap(res.body['data']);
      return mod;
    } on CustomException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw CustomException(e.toString());
    }
  }
}
