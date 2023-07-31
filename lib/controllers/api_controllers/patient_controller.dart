import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/patient_model.dart';
import 'package:medicalty/repositories/patient_repo.dart';

class PatientController extends MasterController {
  final PatientRepo _repo;

  PatientController(this._repo);

  @override
  Future<PatientModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<PatientModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<PatientModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<PatientModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<PatientModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
