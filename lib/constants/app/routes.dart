import 'package:get/get.dart';

import '../../views/contact_us_setting/screen/contact_us_setting_screen.dart';
import '../../views/language_setting/screen/language_setting_screen.dart';
import '../../views/notification_setting/screen/notification_setting_screen.dart';
import '../../views/privacy_policy/screen/privacy_policy_screen.dart';
import '../../views/units_of_measure/screen/units_of_measure_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.unitsOfMeasureScreen,
      page: () => UnitsOfMeasureScreen(),
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
      name: Routes.privacyPolicyScreen,
      page: () => const PrivacyPolicyScreen(),
    ),
  ];
}

class Routes {
  static const unitsOfMeasureScreen = '/unitsOfMeasureScreen';
  static const notificationsSettingsScreen = '/notificationsSettingsScreen';
  static const languageScreen = '/languageScreen';
  static const contactUsScreen = '/contactUsScreen';
  static const privacyPolicyScreen = '/privacyPolicyScreen';
}
