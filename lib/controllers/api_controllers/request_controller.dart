import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/request_model.dart';
import 'package:medicalty/repositories/request_repo.dart';

class RequestController extends MasterController {
  final RequestRepo _repo;

  RequestController(this._repo);

  @override
  Future<RequestModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<RequestModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<RequestModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<RequestModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<RequestModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
