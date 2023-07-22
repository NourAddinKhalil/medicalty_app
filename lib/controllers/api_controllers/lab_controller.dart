import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/lab_model.dart';
import 'package:medicalty/repositories/lab_repo.dart';

class LabController extends MasterController {
  final LabRepo _repo;

  LabController(this._repo);

  @override
  Future<LabModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<LabModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<LabModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<LabModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<LabModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
