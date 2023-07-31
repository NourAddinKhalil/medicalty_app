import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/views/main/widgets/fab.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:medicalty/controllers/screen_controllers/bottom_nav_bar_controller.dart';
import 'package:medicalty/controllers/screen_controllers/theme_controller.dart';
import 'package:medicalty/views/main/widgets/home_widgets/app_drawer.dart';

class MainScreen extends GetView<BottomNavBarController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(),
      // floatingActionButton: const Fab(),
      body: Builder(
        builder: (context) {
          Get.lazyPut(() => context);
          return GetBuilder<BottomNavBarController>(
            init: BottomNavBarController(),
            builder: (controller) {
              return GetBuilder<ThemeController>(builder: (themeProv) {
                // final color =
                //     themeProv.isDarkMode ? Colors.black : Colors.white;
                return PersistentTabView(
                  context,
                  floatingActionButton: const Fab(),
                  controller: controller.navController,
                  screens: controller.screens,
                  items: controller.items.values.toList(),
                  navBarHeight: 66.h,
                  confineInSafeArea: true,
                  backgroundColor: ColorsConstant.primaryColor,
                  handleAndroidBackButtonPress: false,
                  resizeToAvoidBottomInset: true,
                  stateManagement: true,
                  hideNavigationBarWhenKeyboardShows: true,
                  decoration: NavBarDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    colorBehindNavBar: ColorsConstant.primaryColor,
                  ),
                  popAllScreensOnTapOfSelectedTab: false,
                  popActionScreens: PopActionScreensType.once,
                  itemAnimationProperties: const ItemAnimationProperties(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  ),
                  onWillPop: (_) async {
                    final scaffold = Scaffold.of(Get.find());
                    if (scaffold.isEndDrawerOpen) {
                      scaffold.closeEndDrawer();
                      return false;
                    }
                    if (controller.homeIndex ==
                        controller.navController.index) {
                      return true;
                    }
                    controller.navController.index = controller.homeIndex;
                    return false;
                  },
                  onItemSelected: controller.indexChanged,
                  screenTransitionAnimation: const ScreenTransitionAnimation(
                    animateTabTransition: true,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 200),
                  ),
                  navBarStyle: NavBarStyle.style6,
                );
              });
            },
          );
        },
      ),
    );
    // WillPopScope(
    //   onWillPop: () {
    //     if (controller.homeIndex == controller.index) {
    //       return Future.value(true);
    //     }
    //     controller.indexChanged(controller.homeIndex);
    //     return Future.value(false);
    //   },
    //   child: GetBuilder<BottomNavBarController>(
    //     init: BottomNavBarController(),
    //     builder: (controller) {
    //       return Scaffold(
    //         endDrawer: const AppDrawer(),
    //         body: Builder(builder: (context) {
    //           Get.lazyPut(() => context);
    //           return SafeArea(
    //             top: false,
    //             child: LazyLoadIndexedStack(
    //               index: controller.index,
    //               children: [...controller.screens],
    //             ),
    //           );
    //         }),
    //         // floatingActionButton: const Fab(),
    //         // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    //         resizeToAvoidBottomInset: true,
    //         primary: false,
    //         bottomNavigationBar: GetBuilder<ThemeController>(
    //           builder: (themeProv) {
    //             return Padding(
    //               padding: CustomEdgeInsets.horizontal(4.0),
    //               child: BottomNavigationBar(
    //                 // height: 150.h,
    //                 // color: themeProv.isDarkMode ? Colors.black : Colors.white,
    //                 elevation: 0,
    //                 backgroundColor:
    //                     themeProv.isDarkMode ? Colors.black : Colors.white,
    //                 // Theme.of(context).iconTheme.color!.withAlpha(70),
    //                 currentIndex: controller.index,
    //                 type: BottomNavigationBarType.fixed,
    //                 // animationCurve: Curves.bounceInOut,
    //                 // animationDuration: const Duration(milliseconds: 300),
    //                 items: controller.items.values.toList(),
    //                 showSelectedLabels: true,
    //                 showUnselectedLabels: true,
    //                 landscapeLayout:
    //                     BottomNavigationBarLandscapeLayout.centered,
    //                 selectedIconTheme: theme.iconTheme.copyWith(
    //                   color: ColorsConstant.blue2,
    //                 ),
    //                 selectedLabelStyle: theme.textTheme.titleSmall?.copyWith(
    //                   color: ColorsConstant.blue2,
    //                   fontWeight: FontWeight.w400,
    //                 ),
    //                 unselectedIconTheme: theme.iconTheme.copyWith(
    //                   color: const Color(0xff616161),
    //                 ),
    //                 unselectedLabelStyle: theme.textTheme.titleSmall?.copyWith(
    //                   color: const Color(0xff616161),
    //                   fontWeight: FontWeight.w400,
    //                 ),
    //                 onTap: controller.indexChanged,
    //               ),
    //             );
    //           },
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
