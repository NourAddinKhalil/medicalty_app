import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medicalty/controllers/screen_controllers/theme_controller.dart';
import 'package:medicalty/helpers/convert_to_date_time.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/helpers/show_messages.dart';

class ShowDateTimePickers {
  ShowDateTimePickers() {
    initializeDateFormatting('en_US', null);
  }

  static Future<String> showCustomDateTimePicker(String? currentValue) async {
    final okay = currentValue != null && currentValue.isNotEmpty;
    final date = okay
        ? DateTimeHelpers.convertStringToDate(currentValue)
        : DateTime(1999);

    final time = okay ? DateTimeHelpers.getTimeFromDate(date) : '';

    final pickedDate = await showCustomDatePicker(currentValue);

    if (pickedDate.isEmpty) return '';
    final pickedTime = await showCustomTimePicker(time);
    if (pickedTime.isEmpty) return '';

    final dateTime = DateTimeHelpers.convertToDateTime(
      DateTimeHelpers.convertStringToDate(pickedDate),
      DateTimeHelpers.convertToTimeOfDayV2(pickedTime),
    );

    return DateTimeHelpers.convertDateTimeToString(dateTime);
  }

  static Future<String> showCustomDatePicker(
    // BuildContext context,
    String? currentValue, {
    // bool firstDateYearAgo = false,
    // bool lastDateAfterYear = false,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    var curDate = DateTime.now();

    if (currentValue != null && currentValue != '') {
      curDate = DateTimeHelpers.convertStringToDate(currentValue);
    }

    firstDate ??= DateTime(1950);

    // var firstDateLocal = firstDate;

    // if (firstDate != null) {
    //   firstDateLocal = firstDate;
    // } else if (firstDate == null && firstDateYearAgo) {
    //   firstDateLocal = firstDateLocal.subtract(
    //     const Duration(
    //       days: 360,
    //     ),
    //   );
    // }

    // final now = DateTime.now();

    // var lastDateLocal = DateTime(
    //   now.year,
    //   now.month,
    //   now.day,
    //   now.hour,
    //   now.minute,
    // );

    // if (lastDate != null) {
    //   lastDateLocal = lastDate;
    // } else if (lastDate == null && lastDateAfterYear) {
    //   lastDateLocal = lastDateLocal.add(
    //     const Duration(days: 360),
    //   );
    // } else {
    //   lastDateLocal = lastDateLocal.add(
    //     const Duration(days: 7),
    //   );
    // }

    final context = Get.context!;

    final theme = Theme.of(context);

    final pickedDate = await showRoundedDatePicker(
      context: context,
      barrierDismissible: true,
      initialDate: curDate,
      firstDate: firstDate,
      lastDate: lastDate,
      height: 330.h,
      fontFamily: theme.textTheme.bodyLarge?.fontFamily,
      theme: theme.copyWith(
        brightness: theme.brightness,
        primaryColor: theme.colorScheme.primary,
        dialogBackgroundColor: theme.colorScheme.background,
      ),
      description: 'Desc',
      textNegativeButton: 'Cancel',
      textPositiveButton: 'OK',
      // customWeekDays: [
      //   'سبت',
      //   'أحد',
      //   'إثنين',
      //   'ثلوث',
      //   'ربوع',
      //   'خميس',
      //   'جمعة',
      // ],
      builderDay: (dateTime, isCurrentDay, selected, defaultTextStyle) {
        // final dateOnly = DateTimeHelpers.getDateOnly(dateTime);
        // final nowDateOnly = DateTimeHelpers.getDateOnly(now);
        // final isTomorrow =
        //     dateOnly.compareTo(nowDateOnly.add(const Duration(days: 1))) == 0;
        // final isAfterTomorrow =
        //     dateOnly.compareTo(nowDateOnly.add(const Duration(days: 2))) == 0;
        // const tomorrowText = 'Tomorrow';
        // const afterTomorrowText = 'بعد غد';
        // const todayText = 'Today';
        if (selected) {
          final isDark = Get.find<ThemeController>().isDarkMode;
          return Container(
            decoration: const BoxDecoration(
              color: ColorsConstant.green1,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                dateTime.day.toString(),
                style: defaultTextStyle.copyWith(
                  color: isDark ? Colors.black : Colors.white,
                  fontSize: FontSizes.h8?.fontSize,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          );
        }
        // if (isCurrentDay) {
        //   return _textDate(
        //     todayText,
        //     defaultTextStyle,
        //   );
        // }
        // if (isTomorrow) {
        //   return _textDate(
        //     tomorrowText,
        //     defaultTextStyle,
        //   );
        // }
        // if (isAfterTomorrow) {
        //   return _textDate(
        //     afterTomorrowText,
        //     defaultTextStyle,
        //   );
        // }
        return Center(
          child: _textDate(
            dateTime.day.toString(),
            defaultTextStyle,
          ),
        );
      },
      onTapDay: (dateTime, available) {
        if (!available) {
          ShowAnyMessages.faildTask(
            // context,
            'This Date is unavailable',
            showIcon: false,
          );
        }
        return available;
      },
    );

    if (pickedDate == null) {
      if (currentValue != null && currentValue != '') {
        return currentValue;
      }
      return ''; // DateTimeHelpers.convertDateToString(curDate);
    }
    // DateFormat.yMd().format(DateTime.now());

    return DateTimeHelpers.convertDateToString(pickedDate);
    // DateFormat.yMd().format(pickedDate);
  }

  static Center _textDate(String text, TextStyle defaultTextStyle) {
    return Center(
      child: Text(
        text,
        style: defaultTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  static Future<String> showCustomTimePicker(
    // BuildContext context,
    String? currentValue,
  ) async {
    final context = Get.context!;
    var curTime = TimeOfDay.now();
    if (currentValue != null && currentValue != '') {
      curTime = DateTimeHelpers.convertToTimeOfDayV2(currentValue);
    }

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: curTime,
      cancelText: 'Cancel',
      confirmText: 'OK',
      helpText: 'Pick your time',
      errorInvalidText: 'Please enter a valid time',
      hourLabelText: 'Hour',
      minuteLabelText: 'Minute',
    );

    if (pickedTime == null) {
      if (currentValue != null && currentValue != '') {
        return currentValue;
      }
      return ''; //TimeOfDay.now().format(context);
    }
    if (context.mounted) {
      var time = pickedTime.format(context);
      final amPmTIme = pickedTime.format(context).substring(time.length - 2);
      if (amPmTIme.contains('ص')) {
        time = time.replaceRange(time.indexOf('ص'), null, 'AM');
      } else if (amPmTIme.contains('م')) {
        time = time.replaceRange(time.indexOf('م'), null, 'PM');
      }
      return time;
    }
    return currentValue ?? '';
  }
}
