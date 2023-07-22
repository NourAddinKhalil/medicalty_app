import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/pharmacy_product_model.dart';
import 'package:medicalty/repositories/pharmacy_product_repo.dart';

class PharmacyProductController extends MasterController {
  final PharmacyProductRepo _repo;

  PharmacyProductController(this._repo);

  @override
  Future<PharmacyProductModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<PharmacyProductModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<PharmacyProductModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<PharmacyProductModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<PharmacyProductModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
