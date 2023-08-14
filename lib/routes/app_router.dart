import 'package:get/get.dart';
import 'package:medicalty/constants/app/routes.dart';
import 'package:medicalty/views/about/screens/about_screen.dart';
import 'package:medicalty/views/all_screens/screens/all_best_doctors_screen.dart';
import 'package:medicalty/views/all_screens/screens/all_favorite_doctors_screen.dart';
import 'package:medicalty/views/all_screens/screens/all_natural_therapy_screen.dart';
import 'package:medicalty/views/all_screens/screens/all_nurtation_doctors_screen.dart';
import 'package:medicalty/views/all_screens/screens/all_popular_doctors_screen.dart';
import 'package:medicalty/views/all_screens/screens/all_social_worker_screen.dart';
import 'package:medicalty/views/all_screens/screens/my_bills_screen.dart';
import 'package:medicalty/views/all_screens/screens/my_booking_screen.dart';
import 'package:medicalty/views/all_screens/screens/my_reports_screen.dart';
import 'package:medicalty/views/appointment/screens/appointment_booking_screen.dart';
import 'package:medicalty/views/appointment/screens/show_appointment_screen.dart';
import 'package:medicalty/views/attatchment/screens/new_attachment_screen.dart';
import 'package:medicalty/views/auth/screens/create_account_screen.dart';
import 'package:medicalty/views/auth/screens/forget_password_screen.dart';
import 'package:medicalty/views/auth/screens/login_screen.dart';
import 'package:medicalty/views/auth/screens/verify_account_screen.dart';
import 'package:medicalty/views/center/screens/add_new_center_screen.dart';
import 'package:medicalty/views/center/screens/show_center_screen.dart';
import 'package:medicalty/views/client/screens/new_client_screen.dart';
import 'package:medicalty/views/client/screens/show_client_screen.dart';
import 'package:medicalty/views/contact_us_setting/screen/contact_us_setting_screen.dart';
import 'package:medicalty/views/disease/screens/new_disease_screen.dart';
import 'package:medicalty/views/disease/screens/show_disease_screen.dart';
import 'package:medicalty/views/doctor/screens/new_doctor_screen.dart';
import 'package:medicalty/views/doctor/screens/show_doctor_screen.dart';
import 'package:medicalty/views/employee/screens/new_employee_screen.dart';
import 'package:medicalty/views/employee/screens/show_employee_screen.dart';
import 'package:medicalty/views/expense/screens/expnese_details_screen.dart';
import 'package:medicalty/views/expense/screens/new_expense_screen.dart';
import 'package:medicalty/views/expense/screens/show_expense_screen.dart';
import 'package:medicalty/views/experience/screens/new_experience_screen.dart';
import 'package:medicalty/views/experience/screens/show_experience_screen.dart';
import 'package:medicalty/views/insurance_company/screens/new_insurance_company_screen.dart';
import 'package:medicalty/views/insurance_company/screens/show_insurance_comapny_screen.dart';
import 'package:medicalty/views/invoice/screens/new_invoice_screen.dart';
import 'package:medicalty/views/invoice/screens/pay_amount_screen.dart';
import 'package:medicalty/views/lab/screens/new_laboratory_screen.dart';
import 'package:medicalty/views/lab/screens/show_lab_screen.dart';
import 'package:medicalty/views/language_setting/screen/language_setting_screen.dart';
import 'package:medicalty/views/main/screens/home/home_hospital_screen.dart';
import 'package:medicalty/views/main/screens/home/home_pharmacy_screen.dart';
import 'package:medicalty/views/main/screens/home/home_phys_doc_screen.dart';
import 'package:medicalty/views/main/screens/home/home_screen.dart';
import 'package:medicalty/views/main/screens/main_screen.dart';
import 'package:medicalty/views/message/screens/message_screen.dart';
import 'package:medicalty/views/notes/screens/add_new_note_screen.dart';
import 'package:medicalty/views/notification_setting/screen/notification_setting_screen.dart';
import 'package:medicalty/views/notifications/screens/notification_screen.dart';
import 'package:medicalty/views/pathological_scout/screens/new_pathological_scout_screen.dart';
import 'package:medicalty/views/patient/screens/new_patient_screen.dart';
import 'package:medicalty/views/patient/screens/show_patient_screen.dart';
import 'package:medicalty/views/pharmacy/screens/new_pharmacy_product_screen.dart';
import 'package:medicalty/views/pharmacy/screens/new_pharmacy_screen.dart';
import 'package:medicalty/views/pharmacy/screens/show_pharmacy_product_screen.dart';
import 'package:medicalty/views/pharmacy/screens/show_pharmacy_screen.dart';
import 'package:medicalty/views/privacy_policy/screen/privacy_policy_screen.dart';
import 'package:medicalty/views/product/screens/new_product_screen.dart';
import 'package:medicalty/views/product/screens/show_product_screen.dart';
import 'package:medicalty/views/profile/screens/profile_screen.dart';
import 'package:medicalty/views/purchase_plan/screens/purchase_plan_screen.dart';
import 'package:medicalty/views/requests/screens/new_request_screen.dart';
import 'package:medicalty/views/requests/screens/show_request_screen.dart';
import 'package:medicalty/views/section/screens/add_new_section_screen.dart';
import 'package:medicalty/views/section/screens/show_section_screen.dart';
import 'package:medicalty/views/support/screens/support_screen.dart';
import 'package:medicalty/views/temp.dart';
import 'package:medicalty/views/units_of_measure/screen/units_of_measure_screen.dart';
import 'package:medicalty/views/welcom/screens/onboarding_screen.dart';
import 'package:medicalty/views/welcom/screens/user_types_screen.dart';

class AppRouter {
  static const initialRoute = Routes.onBorardingScreen;

  static final routes = [
    GetPage(
      name: Routes.tempScreen,
      page: () => const Temp(),
    ),
    GetPage(
      name: '/AllBestDoctorsScreen',
      page: () => const AllBestDoctorsScreen(),
    ),
    GetPage(
      name: '/AllFvoriteDoctorsScreen',
      page: () => const AllFvoriteDoctorsScreen(),
    ),
    GetPage(
      name: '/AllNaturalTherapyScreen',
      page: () => const AllNaturalTherapyScreen(),
    ),
    GetPage(
      name: '/AllNurtationDoctorsScreen',
      page: () => const AllNurtationDoctorsScreen(),
    ),
    GetPage(
      name: '/AllPopularDoctorsScreen',
      page: () => const AllPopularDoctorsScreen(),
    ),
    GetPage(
      name: '/AllSocialWorkerScreen',
      page: () => const AllSocialWorkerScreen(),
    ),
    GetPage(
      name: '/MyBillsScreen',
      page: () => const MyBillsScreen(),
    ),
    GetPage(
      name: '/MyBookingScreen',
      page: () => const MyBookingScreen(),
    ),
    GetPage(
      name: '/MyReportsScreen',
      page: () => const MyReportsScreen(),
    ),
    GetPage(
      name: Routes.onBorardingScreen,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: Routes.userTypesScreen,
      page: () => const UserTypesScreen(),
    ),
    GetPage(
      name: Routes.aboutScreen,
      page: () => const AboutScreen(),
    ),
    GetPage(
      name: Routes.appointmentBookingScreen,
      page: () => const AppointmentBookingScreen(),
    ),
    GetPage(
      name: Routes.showAppointmentBookingScreen,
      page: () => const ShowAppointmentScreen(),
    ),
    GetPage(
      name: Routes.newAttachmentScreen,
      page: () => const NewAttachmentScreen(),
    ),
    GetPage(
      name: Routes.createAccountScreen,
      page: () => const CreateAccountScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(
      name: Routes.verifyAccountScreen,
      page: () => const VerifyAccountScreen(),
    ),
    GetPage(
      name: Routes.newCenterScreen,
      page: () => const AddNewCenterScreen(),
    ),
    GetPage(
      name: Routes.showCenterScreen,
      page: () => const ShowCenterScreen(),
    ),
    GetPage(
      name: Routes.newClientScreen,
      page: () => const NewClientScreen(),
    ),
    GetPage(
      name: Routes.showClientScreen,
      page: () => const ShowClientScreen(),
    ),
    GetPage(
      name: Routes.newDiseaseScreen,
      page: () => const NewDiseaseScreen(),
    ),
    GetPage(
      name: Routes.showDiseaseScreen,
      page: () => const ShowDiseaseScreen(),
    ),
    GetPage(
      name: Routes.newDoctorScreen,
      page: () => const NewDoctorScreen(),
    ),
    GetPage(
      name: Routes.showDoctorScreen,
      page: () => const ShowDoctorScreen(),
    ),
    GetPage(
      name: Routes.newEmployeeScreen,
      page: () => const NewEmployeeScreen(),
    ),
    GetPage(
      name: Routes.showEmployeeScreen,
      page: () => const ShowEmployeeScreen(),
    ),
    GetPage(
      name: Routes.newExpenseScreen,
      page: () => const NewExpenseScreen(),
    ),
    GetPage(
      name: Routes.showExpenseScreen,
      page: () => const ShowExpenseScreen(),
    ),
    GetPage(
      name: Routes.expenseDetailsScreen,
      page: () => const ExpneseDetailsScreen(),
    ),
    GetPage(
      name: Routes.newExperienceScreen,
      page: () => const NewExperienceScreen(),
    ),
    GetPage(
      name: Routes.showExperienceScreen,
      page: () => const ShowExperienceScreen(),
    ),
    GetPage(
      name: Routes.newInsuranceCompanyScreen,
      page: () => const NewInsuranceCompanyScreen(),
    ),
    GetPage(
      name: Routes.showInsuranceCompanyScreen,
      page: () => const ShowInsuranceComapnyScreen(),
    ),
    GetPage(
      name: Routes.newInvoiceScreen,
      page: () => const NewInvoiceScreen(),
    ),
    GetPage(
      name: Routes.payAmountScreen,
      page: () {
        final tagname = Get.arguments['tag'] ?? '';
        return PayAmountScreen(
          tagName: tagname,
        );
      },
    ),
    GetPage(
      name: Routes.newLabScreen,
      page: () => const NewLaboratoryScreen(),
    ),
    GetPage(
      name: Routes.showLabScreen,
      page: () => const ShowLabScreen(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.pharmacyHomeScreen,
      page: () => const HomePharmacyScreen(),
    ),
    GetPage(
      name: Routes.hospitalCenterHomeScreen,
      page: () => const HomeHospitalScreen(),
    ),
    GetPage(
      name: Routes.physicianDoctorHomeScreen,
      page: () => const HomePhysDocScreen(),
    ),
    GetPage(
      name: Routes.messageScreen,
      page: () => const MessageScreen(),
    ),
    GetPage(
      name: Routes.newNoteScreen,
      page: () => const AddNewNoteScreen(),
    ),
    GetPage(
      name: Routes.notificationScreen,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: Routes.newPathologicalScoutScreen,
      page: () => const NewPathologicalScoutScreen(),
    ),
    GetPage(
      name: Routes.newPatientScreen,
      page: () => const NewPatientScreen(),
    ),
    GetPage(
      name: Routes.showPatientScreen,
      page: () => const ShowPatientScreen(),
    ),
    GetPage(
      name: Routes.newPharmacyScreen,
      page: () => const NewPharmacyScreen(),
    ),
    GetPage(
      name: Routes.showPharmacyScreen,
      page: () => const ShowPharmacyScreen(),
    ),
    GetPage(
      name: Routes.newPharmacyProductScreen,
      page: () => const NewPharmacyProductScreen(),
    ),
    GetPage(
      name: Routes.showPharmacyProductScreen,
      page: () => const ShowPharmacyProductScreen(),
    ),
    GetPage(
      name: Routes.newProductScreen,
      page: () => const NewProductScreen(),
    ),
    GetPage(
      name: Routes.showProductScreen,
      page: () => const ShowProductScreen(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.purchasePlanScreen,
      page: () => const PurchasePlanScreen(),
    ),
    GetPage(
      name: Routes.newRequestScreen,
      page: () => const NewRequestScreen(),
    ),
    GetPage(
      name: Routes.showRequestScreen,
      page: () => const ShowRequestScreen(),
    ),
    GetPage(
      name: Routes.newDepartmentScreen,
      page: () => const AddNewSectionScreen(),
    ),
    GetPage(
      name: Routes.showDepartmentScreen,
      page: () => const ShowSectionScreen(),
    ),
    GetPage(
      name: Routes.supportScreen,
      page: () => const SupportScreen(),
    ),
    GetPage(
      name: Routes.notificationsSettingsScreen,
      page: () => NotificationsSettingsScreen(),
    ),
    GetPage(
      name: Routes.languageScreen,
      page: () => const LanguageScreen(),
    ),
    GetPage(
      name: Routes.contactUsScreen,
      page: () => const ContactUsScreen(),
    ),
    GetPage(
      name: Routes.unitsOfMeasureScreen,
      page: () => UnitsOfMeasureScreen(),
    ),
    GetPage(
      name: Routes.privacyPolicyScreen,
      page: () => const PrivacyPolicyScreen(),
    ),
  ];
}
