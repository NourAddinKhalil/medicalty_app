import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/pathological_scout_model.dart';
import 'package:medicalty/repositories/pathological_scout_repo.dart';

class PathologicalScoutController extends MasterController {
  final PathologicalScoutRepo _repo;

  PathologicalScoutController(this._repo);

  @override
  Future<PathologicalScoutModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<PathologicalScoutModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<PathologicalScoutModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<PathologicalScoutModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<PathologicalScoutModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
