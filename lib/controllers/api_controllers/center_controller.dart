import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/center_model.dart';
import 'package:medicalty/repositories/center_repo.dart';

class CenterController extends MasterController {
  final CenterRepo _repo;

  CenterController(this._repo);

  @override
  Future<CenterModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<CenterModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<CenterModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<CenterModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<CenterModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
