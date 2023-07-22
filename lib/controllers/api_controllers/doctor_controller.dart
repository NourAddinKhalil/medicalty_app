import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/doctor_model.dart';
import 'package:medicalty/repositories/doctor_repo.dart';

class DoctorController extends MasterController {
  final DoctorRepo _repo;

  DoctorController(this._repo);

  @override
  Future<DoctorModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<DoctorModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<DoctorModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<DoctorModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<DoctorModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
