import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'package:medicalty/controllers/api_controllers/appointment_booking_controller.dart';
import 'package:medicalty/controllers/api_controllers/center_controller.dart';
import 'package:medicalty/controllers/api_controllers/client_controller.dart';
import 'package:medicalty/controllers/api_controllers/connection_controller.dart';
import 'package:medicalty/controllers/api_controllers/department_controller.dart';
import 'package:medicalty/controllers/api_controllers/disease_controller.dart';
import 'package:medicalty/controllers/api_controllers/doctor_controller.dart';
import 'package:medicalty/controllers/api_controllers/employee_controller.dart';
import 'package:medicalty/controllers/api_controllers/expense_controller.dart';
import 'package:medicalty/controllers/api_controllers/experience_controller.dart';
import 'package:medicalty/controllers/api_controllers/insurance_company_controller.dart';
import 'package:medicalty/controllers/api_controllers/invoice_controller.dart';
import 'package:medicalty/controllers/api_controllers/lab_controller.dart';
import 'package:medicalty/controllers/api_controllers/pathological_scout_controller.dart';
import 'package:medicalty/controllers/api_controllers/patient_controller.dart';
import 'package:medicalty/controllers/api_controllers/pharmacy_controller.dart';
import 'package:medicalty/controllers/api_controllers/pharmacy_product_controller.dart';
import 'package:medicalty/controllers/api_controllers/product_controller.dart';
import 'package:medicalty/controllers/api_controllers/request_controller.dart';
import 'package:medicalty/repositories/appointment_booking_repo.dart';

import 'package:medicalty/repositories/center_repo.dart';
import 'package:medicalty/repositories/client_repo.dart';
import 'package:medicalty/repositories/department_repo.dart';
import 'package:medicalty/repositories/disease_repo.dart';
import 'package:medicalty/repositories/doctor_repo.dart';
import 'package:medicalty/repositories/employee_repo.dart';
import 'package:medicalty/repositories/expense_repo.dart';
import 'package:medicalty/repositories/experience_repo.dart';
import 'package:medicalty/repositories/insurance_company_repo.dart';
import 'package:medicalty/repositories/invoice_repo.dart';
import 'package:medicalty/repositories/lab_repo.dart';
import 'package:medicalty/repositories/pathological_scout_repo.dart';
import 'package:medicalty/repositories/patient_repo.dart';
import 'package:medicalty/repositories/pharmacy_product_repo.dart';
import 'package:medicalty/repositories/pharmacy_repo.dart';
import 'package:medicalty/repositories/product_repo.dart';
import 'package:medicalty/repositories/request_repo.dart';
import 'package:medicalty/services/api/api_client.dart';
import 'package:medicalty/services/app_info.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() async {
    await AppInfo.getPackageInfo();
    // final sharedPreferences = await SharedPreferences.getInstance();
    const secureStorage = FlutterSecureStorage();
    Get.lazyPut(() => ApiClient(secureStorage: secureStorage), fenix: true);

    /// ************** API Repositories *************** ///
    Get.lazyPut(() => AppointmentBookingRepo(apiClient: Get.find()),
        fenix: true);
    Get.lazyPut(() => CenterRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => ClientRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => ClientRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => DepartmentRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => DiseaseRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => DoctorRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => EmployeeRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => ExpenseRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => ExperienceRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => InsuranceCompanyRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => InvoiceRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => LabRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => PathologicalScoutRepo(apiClient: Get.find()),
        fenix: true);
    Get.lazyPut(() => PatientRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => PharmacyProductRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => PharmacyRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => ProductRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => RequestRepo(apiClient: Get.find()), fenix: true);

    /// ************** API Controllers *************** ///
    Get.put(ConnectionController(), permanent: true);
    Get.lazyPut(() => AppointmentBookingController(Get.find()), fenix: true);
    Get.lazyPut(() => CenterController(Get.find()), fenix: true);
    Get.lazyPut(() => ClientController(Get.find()), fenix: true);
    Get.lazyPut(() => DepartmentController(Get.find()), fenix: true);
    Get.lazyPut(() => DiseaseController(Get.find()), fenix: true);
    Get.lazyPut(() => DoctorController(Get.find()), fenix: true);
    Get.lazyPut(() => EmployeeController(Get.find()), fenix: true);
    Get.lazyPut(() => ExpenseController(Get.find()), fenix: true);
    Get.lazyPut(() => ExperienceController(Get.find()), fenix: true);
    Get.lazyPut(() => InsuranceCompanyController(Get.find()), fenix: true);
    Get.lazyPut(() => InvoiceController(Get.find()), fenix: true);
    Get.lazyPut(() => LabController(Get.find()), fenix: true);
    Get.lazyPut(() => PathologicalScoutController(Get.find()), fenix: true);
    Get.lazyPut(() => PatientController(Get.find()), fenix: true);
    Get.lazyPut(() => PharmacyProductController(Get.find()), fenix: true);
    Get.lazyPut(() => PharmacyController(Get.find()), fenix: true);
    Get.lazyPut(() => ProductController(Get.find()), fenix: true);
    Get.lazyPut(() => RequestController(Get.find()), fenix: true);
  }
}
