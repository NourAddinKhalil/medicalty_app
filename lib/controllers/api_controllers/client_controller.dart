import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/client_model.dart';
import 'package:medicalty/repositories/client_repo.dart';

class ClientController extends MasterController {
  final ClientRepo _repo;

  ClientController(this._repo);

  @override
  Future<ClientModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<ClientModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<ClientModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<ClientModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<ClientModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
