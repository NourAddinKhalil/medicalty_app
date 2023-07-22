import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/invoice_model.dart';
import 'package:medicalty/repositories/invoice_repo.dart';

class InvoiceController extends MasterController {
  final InvoiceRepo _repo;

  InvoiceController(this._repo);

  @override
  Future<InvoiceModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<InvoiceModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<InvoiceModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<InvoiceModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<InvoiceModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
