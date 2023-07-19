import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  SpeedDialChild _buildSpeedDial(String assetIcon, Color color, String title,
      [void Function()? onTap]) {
    return SpeedDialChild(
      backgroundColor: Colors.transparent,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30,
        child: ImageHelpers.getSVGAssetImage(
          60,
          60,
          pic: assetIcon,
        ),
      ),
      // label: title,
      labelWidget: Container(
        padding: CustomEdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.50),
          borderRadius: BorderRadius.circular(10.r),
        ),
        width: 150.w,
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: FontSizes.h7?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      labelStyle: FontSizes.h7?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: ColorsConstant.primaryColor,
      overlayColor: Colors.transparent,
      icon: Icons.add,
      activeIcon: Icons.close,
      activeForegroundColor: const Color(0xFFF8B800),
      foregroundColor: const Color(0xFFF8B800),
      elevation: 0,
      // direction: Get.context?.orientation == Orientation.portrait
      //     ? SpeedDialDirection.up
      //     : SpeedDialDirection.,
      children: [
        _buildSpeedDial(
          Assets.icons.tasks,
          ColorsConstant.blackBlue,
          'Diseases',
          () {
            // Get.toNamed(AppRouter.addTaskRoute);
          },
        ),
        _buildSpeedDial(
          Assets.icons.advance,
          const Color(0xff4285F4),
          'Appointments',
          () {
            // Get.toNamed(AppRouter.addEmployeeRoute);
          },
        ),
        _buildSpeedDial(
          Assets.icons.create,
          const Color(0xffB26196),
          'Experience',
          () {
            // Get.toNamed(AppRouter.addQuoteRoute);
          },
        ),
        _buildSpeedDial(
          Assets.icons.tasks,
          ColorsConstant.blackBlue,
          'Add product',
          () {
            // Get.toNamed(AppRouter.addTaskRoute);
          },
        ),
        _buildSpeedDial(
          Assets.icons.create,
          const Color(0xffB26196),
          'New request',
          () {
            // Get.toNamed(AppRouter.addQuoteRoute);
          },
        ),
        _buildSpeedDial(
          Assets.icons.salaries,
          const Color(0xff4E6A95),
          'Employees',
          () {
            // Get.toNamed(AppRouter.addRequestRoute);
          },
        ),
        _buildSpeedDial(
          Assets.icons.departure,
          const Color(0xffBCC332),
          'Departure',
          () {
            // Get.toNamed(AppRouter.addJobRoute);
          },
        ),
        _buildSpeedDial(
          Assets.icons.invoice,
          const Color(0xff2E2A7B),
          'Invoice',
          () {
            // Get.toNamed(AppRouter.addNewInvoiceRoute);
          },
        ),
        _buildSpeedDial(
          Assets.icons.allrecords,
          const Color(0xff34A853),
          'Spending',
          () {
            // Get.toNamed(AppRouter.expenseRoute);
          },
        ),
        _buildSpeedDial(
          Assets.icons.expenses,
          const Color(0xffF29821),
          'Customers',
          () {
            // Get.toNamed(AppRouter.addNewCustomerRoute);
          },
        ),
        _buildSpeedDial(
          Assets.icons.advance,
          const Color(0xff4285F4),
          'Insurance',
          () {
            // Get.toNamed(AppRouter.addEmployeeRoute);
          },
        ),
        _buildSpeedDial(
          Assets.icons.vacations,
          const Color(0xffEB4335),
          'Departments',
          () {
            // Get.toNamed(AppRouter.addProductRoute);
          },
        ),
        _buildSpeedDial(
          Assets.icons.addition,
          const Color(0xff543211),
          'Doctors',
          () {
            // Get.toNamed(AppRouter.addProjectRoute);
          },
        ),
      ],
      spacing: 15,
    );
  }
}
