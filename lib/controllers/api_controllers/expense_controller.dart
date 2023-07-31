import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/expense_model.dart';
import 'package:medicalty/repositories/expense_repo.dart';

class ExpenseController extends MasterController {
  final ExpenseRepo _repo;

  ExpenseController(this._repo);

  @override
  Future<ExpenseModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<ExpenseModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<ExpenseModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<ExpenseModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<ExpenseModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
