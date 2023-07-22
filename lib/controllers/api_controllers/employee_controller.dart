import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/employee_model.dart';
import 'package:medicalty/repositories/employee_repo.dart';

class EmployeeController extends MasterController {
  final EmployeeRepo _repo;

  EmployeeController(this._repo);

  @override
  Future<EmployeeModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<EmployeeModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<EmployeeModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<EmployeeModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<EmployeeModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
