import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/department_model.dart';
import 'package:medicalty/repositories/department_repo.dart';

class DepartmentController extends MasterController {
  final DepartmentRepo _repo;

  DepartmentController(this._repo);

  @override
  Future<DepartmentModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<DepartmentModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<DepartmentModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<DepartmentModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<DepartmentModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
