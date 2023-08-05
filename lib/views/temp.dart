import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/routes/app_router.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_text_button.dart';

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
            ...AppRouter.routes.map((e) {
              if (e.name == '/temp') {
                return const SizedBox();
              }
              return CustomTextButton(
                title: e.name,
                onPressed: () {
                  Get.toNamed(e.name);
                },
              );
            }).toList(),
            // const Text('Yamen Screens'),
            // const VerticalSizedBox(10),
            // CustomTextButton(
            //   title: 'WriteReviewsScreen',
            //   onPressed: () {
            //     Get.to(() => const WriteReviewsScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'ReviewsScreen',
            //   onPressed: () {
            //     Get.to(() => const ReviewsScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'PrivacyPolicyScreen',
            //   onPressed: () {
            //     Get.to(() => const PrivacyPolicyScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'PaymentCompletedScreen',
            //   onPressed: () {
            //     Get.to(() => PaymentCompletedScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NotificationsSettingsScreen',
            //   onPressed: () {
            //     Get.to(() => NotificationsSettingsScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'PaymentScreen',
            //   onPressed: () {
            //     Get.to(() => const PaymentScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'SettingsScreen',
            //   onPressed: () {
            //     Get.to(() => SettingsScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'PatientScreen',
            //   onPressed: () {
            //     Get.to(() => const yam.PatientScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'LanguageScreen',
            //   onPressed: () {
            //     Get.to(() => const LanguageScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'EditProfileScreen',
            //   onPressed: () {
            //     Get.to(() => const EditProfileScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'EditCardScreen',
            //   onPressed: () {
            //     Get.to(() => const EditCardScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'TrainerDetailScreen',
            //   onPressed: () {
            //     Get.to(() => const TrainerDetailScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'ContactUsScreen',
            //   onPressed: () {
            //     Get.to(() => const ContactUsScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'BookPatientScreen',
            //   onPressed: () {
            //     Get.to(() => const BookPatientScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'AppSettingsScreen',
            //   onPressed: () {
            //     Get.to(() => AppSettingsScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'AddNewCardScreen',
            //   onPressed: () {
            //     Get.to(() => AddNewCardScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'ProfileScreen',
            //   onPressed: () {
            //     Get.to(() => const yam.ProfileScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'UnitsOfMeasureScreen',
            //   onPressed: () {
            //     Get.to(() => UnitsOfMeasureScreen());
            //   },
            // ),
            // const Text('End Yamen Screens'),
            // const VerticalSizedBox(40),
            // CustomTextButton(
            //   title: 'AboutScreen',
            //   onPressed: () {
            //     Get.to(() => const AboutScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'SupportScreen',
            //   onPressed: () {
            //     Get.to(() => const SupportScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'UserTypesScreen',
            //   onPressed: () {
            //     Get.to(() => const UserTypesScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'AddNewNoteScreen',
            //   onPressed: () {
            //     Get.to(() => const AddNewNoteScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'MessageScreen',
            //   onPressed: () {
            //     Get.to(() => const MessageScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'CreateAccountScreen',
            //   onPressed: () {
            //     Get.to(() => const CreateAccountScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'ProfileScreen',
            //   onPressed: () {
            //     Get.to(() => const ProfileScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'ExpneseDetailsScreen',
            //   onPressed: () {
            //     Get.to(() => const ExpneseDetailsScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NotificationScreen',
            //   onPressed: () {
            //     Get.to(() => const NotificationScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'PurchasePlanScreen',
            //   onPressed: () {
            //     Get.to(() => const PurchasePlanScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'SearchScreen',
            //   onPressed: () {
            //     Get.to(() => const SearchScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'AddNewCenterScreen',
            //   onPressed: () {
            //     Get.to(() => const AddNewCenterScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'AddNewSectionScreen',
            //   onPressed: () {
            //     Get.to(() => const AddNewSectionScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewInsuranceCompanyScreen',
            //   onPressed: () {
            //     Get.to(() => const NewInsuranceCompanyScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewClientScreen',
            //   onPressed: () {
            //     Get.to(() => const NewClientScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewExpenseScreen',
            //   onPressed: () {
            //     Get.to(() => const NewExpenseScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewInvoiceScreen',
            //   onPressed: () {
            //     Get.to(() => const NewInvoiceScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewEmployeeScreen',
            //   onPressed: () {
            //     Get.to(() => const NewEmployeeScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewRequestScreen',
            //   onPressed: () {
            //     Get.to(() => const NewRequestScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewProductScreen',
            //   onPressed: () {
            //     Get.to(() => const NewProductScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewDoctorScreen',
            //   onPressed: () {
            //     Get.to(() => const NewDoctorScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewExperienceScreen',
            //   onPressed: () {
            //     Get.to(() => const NewExperienceScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewPatientScreen',
            //   onPressed: () {
            //     Get.to(() => const NewPatientScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'AppointmentBookingScreen',
            //   onPressed: () {
            //     Get.to(() => const AppointmentBookingScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewDiseaseScreen',
            //   onPressed: () {
            //     Get.to(() => const NewDiseaseScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewLaboratoryScreen',
            //   onPressed: () {
            //     Get.to(() => const NewLaboratoryScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewPharmacyScreen',
            //   onPressed: () {
            //     Get.to(() => const NewPharmacyScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewPharmacyProductScreen',
            //   onPressed: () {
            //     Get.to(() => const NewPharmacyProductScreen());
            //   },
            // ),
            // CustomTextButton(
            //   title: 'NewPathologicalScoutScreen',
            //   onPressed: () {
            //     Get.to(() => const NewPathologicalScoutScreen());
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
