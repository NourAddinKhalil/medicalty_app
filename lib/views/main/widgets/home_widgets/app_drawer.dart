import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/show_custom_dialog.dart';
import 'package:medicalty/services/app_info.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/views/about/screens/about_screen.dart';
import 'package:medicalty/views/main/widgets/home_widgets/drawer_buttons.dart';
import 'package:medicalty/views/notifications/screens/notification_screen.dart';
import 'package:medicalty/views/profile/screens/profile_screen.dart';
import 'package:medicalty/views/purchase_plan/screens/purchase_plan_screen.dart';
import 'package:medicalty/views/support/screens/support_screen.dart';
import 'package:medicalty/views/temp.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget _buildDivider() {
    return const Divider(
      thickness: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const VerticalSizedBox(10),
              // ImageHelpers.getSVGAssetImage(
              //   100,
              //   100,
              //   pic: Assets.logos.logo,
              // ),
              const VerticalSizedBox(10),
              DrawerButtons(
                imagePath: Assets.icons.profile,
                title: 'Profile',
                onTab: () {
                  Get.to(() => const ProfileScreen());
                },
              ),
              _buildDivider(),
              DrawerButtons(
                imagePath: Assets.icons.details,
                title: 'Details',
                onTab: () {
                  // Get.to(() => const CompanyDetailsScreen());
                },
              ),
              _buildDivider(),
              DrawerButtons(
                imagePath: Assets.icons.details,
                title: 'Temp',
                onTab: () {
                  Get.to(() => const Temp());
                },
              ),
              _buildDivider(),
              DrawerButtons(
                imagePath: Assets.icons.ringNotification,
                title: 'Notifications',
                onTab: () {
                  Get.to(() => const NotificationScreen());
                },
              ),
              _buildDivider(),
              DrawerButtons(
                imagePath: Assets.icons.subscribed,
                title: 'Subscribtion',
                onTab: () {
                  Get.to(() => const PurchasePlanScreen());
                },
              ),
              _buildDivider(),
              DrawerButtons(
                imagePath: Assets.icons.support,
                title: 'Support',
                onTab: () {
                  Get.to(() => const SupportScreen());
                },
              ),
              _buildDivider(),
              DrawerButtons(
                imagePath: Assets.icons.updateAltsvg,
                title: 'Product Updates',
                onTab: () {
                  // Navigator.of(context).pushNamed(ProfileScreen.routeName);
                },
              ),
              _buildDivider(),
              DrawerButtons(
                imagePath: Assets.icons.about,
                title: 'About Pro-Doctor',
                onTab: () {
                  Get.to(() => const AboutScreen());
                },
              ),
              _buildDivider(),
              DrawerButtons(
                imagePath: Assets.icons.support,
                title: 'Pro-Doctor Setup',
                onTab: () {
                  // Get.to(() => const AboutScreen());
                },
              ),
              _buildDivider(),
              DrawerButtons(
                imagePath: Assets.icons.updateAltsvg,
                title: 'Settings System',
                onTab: () {
                  // Get.to(() => const AboutScreen());
                },
              ),
              _buildDivider(),
              DrawerButtons(
                imagePath: Assets.icons.about,
                title: 'Login Settings',
                onTab: () {
                  // Get.to(() => const AboutScreen());
                },
              ),
              _buildDivider(),
              DrawerButtons(
                imagePath: Assets.icons.logoutRed,
                iconColor: Colors.red,
                textColor: Colors.red,
                // iconData: Icons.logout_outlined,
                title: 'Logout',
                onTab: () async {
                  final logout =
                      await ShowCustomDialog.showConfirmationDialogMessage(
                    'Are you sure you want to logout?',
                    'Logout Confirmation',
                  );
                  if (logout) {
                    // await Get.find<AuthController>().logout();
                    // await Get.find<LocalAuthController>().registerBio();
                    // Get.offAllNamed(
                    //   AppRouter.loginRoute,
                    //   predicate: (route) => false,
                    // );
                  }
                },
              ),
              Center(
                child: Text(
                  'version ${AppInfo.getAppVersion}',
                  style: FontSizes.h8?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
              const VerticalSizedBox(8),
            ],
          ),
        ),
      ),
    );
  }
}
