import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/constants/themes/theme_helpers.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/main/widgets/home_widgets/open_drawer_btn.dart';
import 'package:medicalty/views/notifications/screens/notification_screen.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  const CustomSliverDelegate({
    this.expandedHeight = 230,
    required this.title,
    this.subtitle,
    required this.image,
    this.imageWidth = 60,
    this.imageHeight = 60,
  });
  final String title;
  final String? subtitle;
  final String image;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        buildAppbarBody(shrinkOffset),
        // buildAppbar(shrinkOffset),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  Widget buildAppbar(double shrinkOffset) {
    final opacity = appear(shrinkOffset);

    return Opacity(
      opacity: _checkOpacity(opacity),
      child: AppBar(
        systemOverlayStyle: ThemeHelpers.systemUiOverlayStyle(
          Colors.transparent,
          true,
        ),
        centerTitle: false,
        // toolbarHeight: expandedHeight.h,
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: FontSizes.h6?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: _buildNotificationsButton(),
        actions: const [
          OpenDrawerBtn(),
          // _buildSettingsButton(),
        ],
      ),
    );
  }

  // Widget _buildSettingsButton() {
  //   return CustomIconButton(
  //     iconData: Icons.settings_outlined,
  //     tooltip: 'Settings',
  //     iconColor: Colors.white,
  //     allowOnlineOnly: false,
  //     allowRegisterOnly: false,
  //     onPressed: () {
  //       Scaffold.of(Get.find()).openEndDrawer();
  //       // globalKey.currentState?.openEndDrawer();
  //     },
  //   );
  // }

  Widget _buildNotificationsButton() {
    return CustomIconButton(
      iconData: Icons.notifications_none_rounded,
      tooltip: 'Notification',
      allowOnlineOnly: false,
      allowRegisterOnly: false,
      iconSize: 30,
      // iconColor: Colors.white,
      onPressed: () {
        Get.to(() => const NotificationScreen());
      },
    );
  }

  double disappear(double shrinkOffset) => 1 - shrinkOffset / maxExtent;

  double _checkOpacity(double opacity) {
    return opacity > 1
        ? 1
        : opacity < 0
            ? 0
            : opacity;
  }

  Widget buildAppbarBody(double shrinkOffset) {
    // final hiding = disappear(shrinkOffset) < 1;
    final opacity = disappear(shrinkOffset);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: ThemeHelpers.systemUiOverlayStyle(
        Colors.transparent,
        false,
      ),
      child: Opacity(
        opacity: _checkOpacity(opacity),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            ),
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: CustomEdgeInsets.only(
                      left: 15.0, right: 15.0, top: kToolbarHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleSqureImage(
                                pic: image,
                                radius: imageHeight / 2,
                                width: imageWidth,
                                height: imageHeight,
                              ),
                              const HorizantalSizedBox(8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello, Good morning',
                                    style: FontSizes.h9?.copyWith(
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  Text(
                                    title,
                                    textAlign: TextAlign.start,
                                    style: FontSizes.h5?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      _buildNotificationsButton(),
                    ],
                  ),
                ),
                const VerticalSizedBox(20),
                CustomTextFormField(
                  label: 'Search',
                  showlable: false,
                  showHint: true,
                  horizantalPadding: 20,
                  fillColor: Colors.transparent,
                  leading: Icon(
                    Icons.search,
                    size: 30.sp,
                    color: ColorsConstant.primaryColor,
                  ),
                  innerTextStyle: FontSizes.h8?.copyWith(
                    color: ColorsConstant.primaryColor,
                  ),
                  controller: null,
                  validator: null,
                  onSaved: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildImage() {
  //   return ImageHelpers.getNetworkImage(
  //     image,
  //     imageWidth,
  //     imageHeight,
  //     image,
  //     // boxFit: BoxFit.contain,
  //   );
  // }

  @override
  double get maxExtent => expandedHeight.h;

  @override
  double get minExtent => expandedHeight.h; //100.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
