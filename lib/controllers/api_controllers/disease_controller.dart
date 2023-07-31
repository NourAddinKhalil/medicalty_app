import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/disease_model.dart';
import 'package:medicalty/repositories/disease_repo.dart';

class DiseaseController extends MasterController {
  final DiseaseRepo _repo;

  DiseaseController(this._repo);

  @override
  Future<DiseaseModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<DiseaseModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<DiseaseModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<DiseaseModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<DiseaseModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
