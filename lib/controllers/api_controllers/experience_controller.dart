import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/experience_model.dart';
import 'package:medicalty/repositories/experience_repo.dart';

class ExperienceController extends MasterController {
  final ExperienceRepo _repo;

  ExperienceController(this._repo);

  @override
  Future<ExperienceModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<ExperienceModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<ExperienceModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<ExperienceModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<ExperienceModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
