import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/product_model.dart';
import 'package:medicalty/repositories/product_repo.dart';

class ProductController extends MasterController {
  final ProductRepo _repo;

  ProductController(this._repo);

  @override
  Future<ProductModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<ProductModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<ProductModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<ProductModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<ProductModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
