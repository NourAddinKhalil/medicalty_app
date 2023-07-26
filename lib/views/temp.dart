import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_text_button.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/views/about/screens/about_screen.dart';
import 'package:medicalty/views/add_new_card/screen/add_new_card_screen.dart';
import 'package:medicalty/views/app_setting/screen/app_settings_screen.dart';
import 'package:medicalty/views/appointment/screens/appointment_booking_screen.dart';
import 'package:medicalty/views/auth/screens/create_account_screen.dart';
import 'package:medicalty/views/book_patient/book_patient_screen.dart';
import 'package:medicalty/views/center/screens/add_new_center_screen.dart';
import 'package:medicalty/views/client/screens/new_client_screen.dart';
import 'package:medicalty/views/contact_us_setting/screen/contact_us_setting_screen.dart';
import 'package:medicalty/views/disease/screens/new_disease_screen.dart';
import 'package:medicalty/views/doctor/screens/new_doctor_screen.dart';
import 'package:medicalty/views/edit_card/screen/edit_card_screen.dart';
import 'package:medicalty/views/edit_profile/screen/edit_profile_screen.dart';
import 'package:medicalty/views/employee/screens/new_employee_screen.dart';
import 'package:medicalty/views/expense/screens/expnese_details_screen.dart';
import 'package:medicalty/views/expense/screens/new_expense_screen.dart';
import 'package:medicalty/views/experience/screens/new_experience_screen.dart';
import 'package:medicalty/views/home/screen/home_screen.dart';
import 'package:medicalty/views/insurance_company/screens/new_insurance_company_screen.dart';
import 'package:medicalty/views/invoice/screens/new_invoice_screen.dart';
import 'package:medicalty/views/lab/screens/new_laboratory_screen.dart';
import 'package:medicalty/views/language_setting/screen/language_setting_screen.dart';
import 'package:medicalty/views/notification_setting/screen/notification_setting_screen.dart';
import 'package:medicalty/views/pathological_scout/screens/new_pathological_scout_screen.dart';
import 'package:medicalty/views/payment/screen/payment_screen.dart';
import 'package:medicalty/views/payment_completed/screen/payment_completed_screen.dart';
import 'package:medicalty/views/pharmacy/screens/new_pharmacy_product_screen.dart';
import 'package:medicalty/views/main/screens/search/search_screen.dart';
import 'package:medicalty/views/message/screens/message_screen.dart';
import 'package:medicalty/views/notes/screens/add_new_note_screen.dart';
import 'package:medicalty/views/notifications/screens/notification_screen.dart';
import 'package:medicalty/views/patient/screens/new_patient_screen.dart';
import 'package:medicalty/views/patient/screen/patient_screen.dart' as yam;
import 'package:medicalty/views/pharmacy/screens/new_pharmacy_screen.dart';
import 'package:medicalty/views/privacy_policy/screen/privacy_policy_screen.dart';
import 'package:medicalty/views/product/screens/new_product_screen.dart';
import 'package:medicalty/views/profile/screens/profile_screen.dart';
import 'package:medicalty/views/profile/screen/profile_screen.dart' as yam;
import 'package:medicalty/views/purchase_plan/screens/purchase_plan_screen.dart';
import 'package:medicalty/views/requests/screens/new_request_screen.dart';
import 'package:medicalty/views/review/screen/review_screen.dart';
import 'package:medicalty/views/section/screens/add_new_section_screen.dart';
import 'package:medicalty/views/settings/screen/settings_screen.dart';
import 'package:medicalty/views/support/screens/support_screen.dart';
import 'package:medicalty/views/units_of_measure/screen/units_of_measure_screen.dart';
import 'package:medicalty/views/welcom/screens/user_types_screen.dart';
import 'package:medicalty/views/write_a_review/screen/write_a_review_screen.dart';

import 'doctor_detailes/screen/doctor_detail_screen.dart';

class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'temp',
        ),
        body: ListView(
          children: [
            const Text('Yamen Screens'),
            const VerticalSizedBox(10),
            CustomTextButton(
              title: 'WriteReviewsScreen',
              onPressed: () {
                Get.to(() => const WriteReviewsScreen());
              },
            ),
            CustomTextButton(
              title: 'ReviewsScreen',
              onPressed: () {
                Get.to(() => const ReviewsScreen());
              },
            ),
            CustomTextButton(
              title: 'PrivacyPolicyScreen',
              onPressed: () {
                Get.to(() => const PrivacyPolicyScreen());
              },
            ),
            CustomTextButton(
              title: 'PaymentCompletedScreen',
              onPressed: () {
                Get.to(() => PaymentCompletedScreen());
              },
            ),
            CustomTextButton(
              title: 'NotificationsSettingsScreen',
              onPressed: () {
                Get.to(() => NotificationsSettingsScreen());
              },
            ),
            CustomTextButton(
              title: 'PaymentScreen',
              onPressed: () {
                Get.to(() => const PaymentScreen());
              },
            ),
            CustomTextButton(
              title: 'SettingsScreen',
              onPressed: () {
                Get.to(() => SettingsScreen());
              },
            ),
            CustomTextButton(
              title: 'PatientScreen',
              onPressed: () {
                Get.to(() => const yam.PatientScreen());
              },
            ),
            CustomTextButton(
              title: 'LanguageScreen',
              onPressed: () {
                Get.to(() => const LanguageScreen());
              },
            ),
            CustomTextButton(
              title: 'HomeScreen',
              onPressed: () {
                Get.to(() => const HomeScreen());
              },
            ),
            CustomTextButton(
              title: 'EditProfileScreen',
              onPressed: () {
                Get.to(() => const EditProfileScreen());
              },
            ),
            CustomTextButton(
              title: 'EditCardScreen',
              onPressed: () {
                Get.to(() => const EditCardScreen());
              },
            ),
            CustomTextButton(
              title: 'TrainerDetailScreen',
              onPressed: () {
                Get.to(() => const TrainerDetailScreen());
              },
            ),
            CustomTextButton(
              title: 'ContactUsScreen',
              onPressed: () {
                Get.to(() => const ContactUsScreen());
              },
            ),
            CustomTextButton(
              title: 'BookPatientScreen',
              onPressed: () {
                Get.to(() => const BookPatientScreen());
              },
            ),
            CustomTextButton(
              title: 'AppSettingsScreen',
              onPressed: () {
                Get.to(() => AppSettingsScreen());
              },
            ),
            CustomTextButton(
              title: 'AddNewCardScreen',
              onPressed: () {
                Get.to(() => AddNewCardScreen());
              },
            ),
            CustomTextButton(
              title: 'ProfileScreen',
              onPressed: () {
                Get.to(() => yam.ProfileScreen());
              },
            ),
            CustomTextButton(
              title: 'UnitsOfMeasureScreen',
              onPressed: () {
                Get.to(() => UnitsOfMeasureScreen());
              },
            ),
            const Text('End Yamen Screens'),
            const VerticalSizedBox(40),
            CustomTextButton(
              title: 'AboutScreen',
              onPressed: () {
                Get.to(() => const AboutScreen());
              },
            ),
            CustomTextButton(
              title: 'SupportScreen',
              onPressed: () {
                Get.to(() => const SupportScreen());
              },
            ),
            CustomTextButton(
              title: 'UserTypesScreen',
              onPressed: () {
                Get.to(() => const UserTypesScreen());
              },
            ),
            CustomTextButton(
              title: 'AddNewNoteScreen',
              onPressed: () {
                Get.to(() => const AddNewNoteScreen());
              },
            ),
            CustomTextButton(
              title: 'MessageScreen',
              onPressed: () {
                Get.to(() => const MessageScreen());
              },
            ),
            CustomTextButton(
              title: 'CreateAccountScreen',
              onPressed: () {
                Get.to(() => const CreateAccountScreen());
              },
            ),
            CustomTextButton(
              title: 'ProfileScreen',
              onPressed: () {
                Get.to(() => const ProfileScreen());
              },
            ),
            CustomTextButton(
              title: 'ExpneseDetailsScreen',
              onPressed: () {
                Get.to(() => const ExpneseDetailsScreen());
              },
            ),
            CustomTextButton(
              title: 'NotificationScreen',
              onPressed: () {
                Get.to(() => const NotificationScreen());
              },
            ),
            CustomTextButton(
              title: 'PurchasePlanScreen',
              onPressed: () {
                Get.to(() => const PurchasePlanScreen());
              },
            ),
            CustomTextButton(
              title: 'SearchScreen',
              onPressed: () {
                Get.to(() => const SearchScreen());
              },
            ),
            CustomTextButton(
              title: 'AddNewCenterScreen',
              onPressed: () {
                Get.to(() => const AddNewCenterScreen());
              },
            ),
            CustomTextButton(
              title: 'AddNewSectionScreen',
              onPressed: () {
                Get.to(() => const AddNewSectionScreen());
              },
            ),
            CustomTextButton(
              title: 'NewInsuranceCompanyScreen',
              onPressed: () {
                Get.to(() => const NewInsuranceCompanyScreen());
              },
            ),
            CustomTextButton(
              title: 'NewClientScreen',
              onPressed: () {
                Get.to(() => const NewClientScreen());
              },
            ),
            CustomTextButton(
              title: 'NewExpenseScreen',
              onPressed: () {
                Get.to(() => const NewExpenseScreen());
              },
            ),
            CustomTextButton(
              title: 'NewInvoiceScreen',
              onPressed: () {
                Get.to(() => const NewInvoiceScreen());
              },
            ),
            CustomTextButton(
              title: 'NewEmployeeScreen',
              onPressed: () {
                Get.to(() => const NewEmployeeScreen());
              },
            ),
            CustomTextButton(
              title: 'NewRequestScreen',
              onPressed: () {
                Get.to(() => const NewRequestScreen());
              },
            ),
            CustomTextButton(
              title: 'NewProductScreen',
              onPressed: () {
                Get.to(() => const NewProductScreen());
              },
            ),
            CustomTextButton(
              title: 'NewDoctorScreen',
              onPressed: () {
                Get.to(() => const NewDoctorScreen());
              },
            ),
            CustomTextButton(
              title: 'NewExperienceScreen',
              onPressed: () {
                Get.to(() => const NewExperienceScreen());
              },
            ),
            CustomTextButton(
              title: 'NewPatientScreen',
              onPressed: () {
                Get.to(() => const NewPatientScreen());
              },
            ),
            CustomTextButton(
              title: 'AppointmentBookingScreen',
              onPressed: () {
                Get.to(() => const AppointmentBookingScreen());
              },
            ),
            CustomTextButton(
              title: 'NewDiseaseScreen',
              onPressed: () {
                Get.to(() => const NewDiseaseScreen());
              },
            ),
            CustomTextButton(
              title: 'NewLaboratoryScreen',
              onPressed: () {
                Get.to(() => const NewLaboratoryScreen());
              },
            ),
            CustomTextButton(
              title: 'NewPharmacyScreen',
              onPressed: () {
                Get.to(() => const NewPharmacyScreen());
              },
            ),
            CustomTextButton(
              title: 'NewPharmacyProductScreen',
              onPressed: () {
                Get.to(() => const NewPharmacyProductScreen());
              },
            ),
            CustomTextButton(
              title: 'NewPathologicalScoutScreen',
              onPressed: () {
                Get.to(() => const NewPathologicalScoutScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
