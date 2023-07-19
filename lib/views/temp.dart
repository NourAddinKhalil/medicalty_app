import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_text_button.dart';
import 'package:medicalty/views/about/screens/about_screen.dart';
import 'package:medicalty/views/appointment/screens/appointment_booking_screen.dart';
import 'package:medicalty/views/auth/screens/create_account_screen.dart';
import 'package:medicalty/views/center/screens/add_new_center_screen.dart';
import 'package:medicalty/views/client/screens/new_client_screen.dart';
import 'package:medicalty/views/disease/screens/new_disease_screen.dart';
import 'package:medicalty/views/doctor/screens/new_doctor_screen.dart';
import 'package:medicalty/views/employee/screens/new_employee_screen.dart';
import 'package:medicalty/views/expense/screens/expnese_details_screen.dart';
import 'package:medicalty/views/expense/screens/new_expense_screen.dart';
import 'package:medicalty/views/experience/screens/new_experience_screen.dart';
import 'package:medicalty/views/insurance_company/screens/new_insurance_company_screen.dart';
import 'package:medicalty/views/invoice/screens/new_invoice_screen.dart';
import 'package:medicalty/views/lab/screens/new_laboratory_screen.dart';
import 'package:medicalty/views/pathological_scout/screens/new_pathological_scout_screen.dart';
import 'package:medicalty/views/pharmacy/screens/new_pharmacy_product_screen.dart';
import 'package:medicalty/views/main/screens/search/search_screen.dart';
import 'package:medicalty/views/message/screens/message_screen.dart';
import 'package:medicalty/views/notes/screens/add_new_note_screen.dart';
import 'package:medicalty/views/notifications/screens/notification_screen.dart';
import 'package:medicalty/views/patient/screens/new_patient_screen.dart';
import 'package:medicalty/views/pharmacy/screens/new_pharmacy_screen.dart';
import 'package:medicalty/views/product/screens/new_product_screen.dart';
import 'package:medicalty/views/profile/screens/profile_screen.dart';
import 'package:medicalty/views/purchase_plan/screens/purchase_plan_screen.dart';
import 'package:medicalty/views/requests/screens/new_request_screen.dart';
import 'package:medicalty/views/section/screens/add_new_section_screen.dart';
import 'package:medicalty/views/support/screens/support_screen.dart';
import 'package:medicalty/views/welcom/screens/user_types_screen.dart';

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
