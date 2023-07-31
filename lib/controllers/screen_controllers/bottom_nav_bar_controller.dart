import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';
import 'package:medicalty/views/main/screens/home/home_hospital_screen.dart';
import 'package:medicalty/views/main/screens/home/home_pharmacy_screen.dart';
import 'package:medicalty/views/main/screens/home/home_phys_doc_screen.dart';
import 'package:medicalty/views/main/screens/home/home_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'package:medicalty/views/main/screens/search/search_screen.dart';

class BottomNavBarController extends HelpersController {
  int index = 0;
  final homeIndex = 0;
  // late Map<String, BottomNavigationBarItem> items;
  late Map<String, PersistentBottomNavBarItem> items;
  late PersistentTabController navController;

  BottomNavBarController() {
    index = homeIndex;
    navController = PersistentTabController(initialIndex: homeIndex);

    items = {
      'profile': PersistentBottomNavBarItem(
        icon: ImageHelpers.getSVGAssetImage(
          30,
          30,
          pic: Assets.icons.firstIconActive,
        ),
        inactiveIcon: ImageHelpers.getSVGAssetImage(
          30,
          30,
          pic: Assets.icons.firstIconNon,
        ),
      ),
      'schedule': PersistentBottomNavBarItem(
        icon: ImageHelpers.getSVGAssetImage(
          30,
          30,
          pic: Assets.icons.secondIconActive,
        ),
        inactiveIcon: ImageHelpers.getSVGAssetImage(
          30,
          30,
          pic: Assets.icons.secondIconNon,
        ),
      ),
      'search': PersistentBottomNavBarItem(
        icon: ImageHelpers.getSVGAssetImage(
          30,
          30,
          pic: Assets.icons.thirdIconActive,
        ),
        inactiveIcon: ImageHelpers.getSVGAssetImage(
          30,
          30,
          pic: Assets.icons.thirdIconNon,
        ),
      ),
      'home': PersistentBottomNavBarItem(
        icon: ImageHelpers.getSVGAssetImage(
          30,
          30,
          pic: Assets.icons.forthIconActive,
        ),
        inactiveIcon: ImageHelpers.getSVGAssetImage(
          30,
          30,
          pic: Assets.icons.forthIconNon,
        ),
      ),
      'timeSheet': PersistentBottomNavBarItem(
        icon: ImageHelpers.getSVGAssetImage(
          30,
          30,
          pic: Assets.icons.fifthIconActive,
        ),
        inactiveIcon: ImageHelpers.getSVGAssetImage(
          30,
          30,
          pic: Assets.icons.fifthIconNon,
        ),
      ),
      // 'add': PersistentBottomNavBarItem(
      //   onPressed: (_) {},
      //   icon: Transform.translate(
      //     offset: const Offset(10, -5),
      //     child: const Fab(),
      //   ),
      // ),
    };
  }

  // void checkLocation() async {
  //   var serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     final open = await ShowCustomDialog.showConfirmationDialogMessage(
  //       'GPS not opened!\n open GPS to make the app full functioned.',
  //       '${AppInfo.getAppName} needs GPS to be opened',
  //       noBtn: 'Cancel',
  //       yseBtn: 'OK',
  //     );
  //     if (open) {
  //       await Geolocator.openLocationSettings();
  //     } else {
  //       return;
  //     }
  //   }
  // }

  // @override
  // void onInit() async {
  //   super.onInit();
  //   // checkLocation();
  // }

  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const HomeHospitalScreen(),
    const HomePhysDocScreen(),
    const HomePharmacyScreen(),
  ];

  // Widget get getScreen {
  //   return screens[index];
  // }

  void indexChanged(int idx) {
    if (idx == items.values.length - 1) return;
    if (idx != index) {
      index = idx;
      navController.index = index;
      update();
    }
  }

  @override
  void dispose() {
    navController.dispose();
    super.dispose();
  }
}
