import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/models/appointment_booking_model.dart';
import 'package:medicalty/repositories/appointment_booking_repo.dart';

class AppointmentBookingController extends MasterController {
  final AppointmentBookingRepo _repo;

  AppointmentBookingController(this._repo);

  @override
  Future<AppointmentBookingModel> getSingle(id) async {
    final res = await _repo.getSingle(id);

    return res;
  }

  @override
  Future<List<AppointmentBookingModel>> get() async {
    final res = await _repo.get();

    return res;
  }

  @override
  Future<List<AppointmentBookingModel>> search(query) async {
    if (query.isEmpty) {
      return [];
    }

    query = {'query': query};
    final res = await _repo.search(query);
    return res;
  }

  @override
  Future<AppointmentBookingModel> add(model) async {
    return await _repo.add(model);
  }

  @override
  Future<AppointmentBookingModel> edit(model) async {
    return await _repo.edit(model);
  }

  @override
  Future<bool> delete(model) async {
    return await _repo.delete(model);
  }
}
