import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/insurance_company_model.dart';
import 'package:medicalty/repositories/insurance_company_repo.dart';

class InsuranceCompanyController extends MasterController {
  final InsuranceCompanyRepo _repo;

  InsuranceCompanyController(this._repo);

  @override
  Future<InsuranceCompanyModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<InsuranceCompanyModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<InsuranceCompanyModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<InsuranceCompanyModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<InsuranceCompanyModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
