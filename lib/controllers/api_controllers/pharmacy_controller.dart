import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/pharmacy_model.dart';
import 'package:medicalty/repositories/pharmacy_repo.dart';

class PharmacyController extends MasterController {
  final PharmacyRepo _repo;

  PharmacyController(this._repo);

  @override
  Future<PharmacyModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<PharmacyModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<PharmacyModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<PharmacyModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<PharmacyModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
