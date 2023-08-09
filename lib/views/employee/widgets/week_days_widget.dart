import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/controllers/screen_controllers/employee_screen_controller.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/show_date_time_picker.dart';
import 'package:medicalty/helpers/validators.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class WeekDaysWidget extends GetView<EmployeeScreenController> {
  const WeekDaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: controller.weekDaysScheduleList.map(
        (e) {
          final startTime = controller.weekDaysControllers[e.id.index][0];
          final endTime = controller.weekDaysControllers[e.id.index][1];
          final onSaved = controller.weekDaysSaveList[e.id.index];

          return GetBuilder<EmployeeScreenController>(
            id: e.name,
            builder: (controller) {
              if (e.hide) {
                return Center(
                  child: Padding(
                    padding: CustomEdgeInsets.only(top: 8.0),
                    child: CustomIconButton(
                      iconSize: 30,
                      style: IconButton.styleFrom(
                        backgroundColor: ColorsConstant.primaryColor,
                        foregroundColor: Colors.white,
                      ),
                      iconData: Icons.add,
                      tooltip: 'add ${e.name}',
                      onPressed: () {
                        controller.showDay(e);
                        e = e.copyWith(hide: false);
                      },
                    ),
                  ),
                );
              }
              return Row(
                children: [
                  SizedBox(
                    width: 113.w,
                    child: Text(
                      e.name,
                      style: FontSizes.h6?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const HorizantalSizedBox(4),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Start Time',
                      controller: startTime,
                      validator: (value) {
                        return Validators.validateTimeFormat(value, true);
                      },
                      fillColor: null,
                      readOnly: true,
                      showHint: true,
                      showlable: false,
                      onTap: () async {
                        startTime.text =
                            await ShowDateTimePickers.showCustomTimePicker(
                                startTime.text);
                      },
                      showSuffix: false,
                      showUnderlinedStyle: true,
                      onSaved: onSaved,
                    ),
                  ),
                  const HorizantalSizedBox(4),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'End Time',
                      controller: endTime,
                      fillColor: null,
                      validator: (value) {
                        return Validators.validateTimeFormat(value, true);
                      },
                      readOnly: true,
                      showHint: true,
                      showlable: false,
                      onTap: () async {
                        endTime.text =
                            await ShowDateTimePickers.showCustomTimePicker(
                                endTime.text);
                      },
                      showSuffix: false,
                      showUnderlinedStyle: true,
                      onSaved: onSaved,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.hideDay(e);
                      e = e.copyWith(hide: true);
                    },
                    child: SizedBox(
                      width: 20.w,
                      child: ImageHelpers.getSVGAssetImage(
                        16,
                        16,
                        pic: Assets.icons.delete,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ).toList(),
    );
  }
}
