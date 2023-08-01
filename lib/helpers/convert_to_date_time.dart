import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeHelpers {
  DateTimeHelpers() {
    initializeDateFormatting('en_US', null);
  }

  ///returns the data to millisecondsSinceEpoch
  static int getToDayDate() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static bool isDateNOWAfter(DateTime date) {
    final fnow = getDateOnly(DateTime.now());
    final dateOnly = getDateOnly(date);

    return fnow.compareTo(dateOnly) > 0;
  }

  static bool isDateNOWEquals(DateTime date) {
    final fnow = getDateOnly(DateTime.now());
    final dateOnly = getDateOnly(date);

    return fnow.compareTo(dateOnly) == 0;
  }

  static bool isDateTimeNOWAfter(DateTime date) {
    final fnow = DateTime.now();

    return fnow.compareTo(date) > 0;
  }

  static DateTime substuctDate(DateTime date, int value) {
    return date.subtract(
      Duration(minutes: value),
    );
  }

  //returns the date to full date time with second and minute
  static DateTime convertToDateTime(DateTime date, TimeOfDay time) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  ///convert date to 'DateFormat.yMd()' format as DateTime
  static DateTime convertStringToDate(String date) {
    return DateFormat('yyyy-MM-dd').parse(date);
  }

  ///convert date to 'DateFormat.yMd().add_jm()' format as DateTime
  static DateTime convertStringToDateTime(String date) {
    return DateFormat('yyyy-MM-dd HH:mm').parse(date);
  }

  static DateTime getDateOnly(DateTime date) {
    // final dateOnlyString = DateFormat.yMd().format(date);
    // final dateOnly = DateFormat.yMd().parse(dateOnlyString);
    final dateOnlyString = DateFormat('yyyy-MM-dd').format(date);
    final dateOnly = DateFormat('yyyy-MM-dd').parse(dateOnlyString);
    return dateOnly;
  }

  ///convert date to 'DateFormat.yMd()' format as String
  static String convertDateToString(DateTime dateTime) {
    // return DateFormat.yMd().format(dateTime);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  ///convert dateTime to 'DateFormat.yMd().add_jm()' format as String
  static String convertDateTimeToString(DateTime dateTime,
      {bool hours24 = true}) {
    if (hours24) {
      // return DateFormat.yMd().add_Hm().format(dateTime);
      return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    }
    // return DateFormat.yMd().add_jm().format(dateTime);
    return DateFormat('yyyy-MM-dd hh:mm a').format(dateTime);
  }

  ///convert dateTime to 'DateFormat.Hm()' format as String
  static String convertDateTimeToTimeString(DateTime dateTime,
      {bool hours12 = false}) {
    if (hours12) {
      return DateFormat.jm().format(dateTime);
    }
    return DateFormat.Hm().format(dateTime);
  }

  // static TimeOfDay convertToTimeOfDay(String time) {
  //   return TimeOfDay(
  //     hour: int.parse(time.split(':')[0]),
  //     minute: int.parse(time.split(':')[1]),
  //   );
  // }

  static TimeOfDay convertToTimeOfDayV2(String time) {
    return TimeOfDay.fromDateTime(
      DateFormat(DateTimeHelpers.returnTimeMode(time)).parse(time),
    );
  }

  static String convertTimeOfDayToString(TimeOfDay time, [bool is24 = true]) {
    final date = DateTime(1999, 1, 1, time.hour, time.minute);
    if (is24) {
      // return DateFormat.yMd().add_Hm().format(dateTime);
      return DateFormat('HH:mm').format(date);
    }
    return DateFormat('hh:mm a').format(date);
  }

  static String returnTimeMode(String time) {
    if (time.contains('AM') || time.contains('PM')) {
      return 'hh:mm a';
    } else {
      return 'HH:mm';
    }
  }

  ///Returns the time as 'hh:mm aa' Format From the specefied Date
  static String getTimeFromDate(DateTime date) {
    // final time = DateFormat('hh:mm aa').format(date);
    final time = DateFormat('HH:mm').format(date);
    return time;
  }

  ///Returns the Date as 'String in ar' Format From the specefied Date
  static String getDateInLetterFormat(DateTime date,
      [String? locale = 'en_US']) {
    final dateString = DateFormat.MMMMEEEEd(locale).format(date);
    return dateString;
  }

  ///Returns the Day as 'String ' Format From the specefied Date
  static String getDayInLetterFormatFromDate(DateTime date,
      [String? locale = 'en_US']) {
    final dateString = DateFormat.E(locale).format(date);
    return dateString;
  }

  ///Returns the Date as 'DayInLetter, Month dayth' Format From the specefied Date
  static String getLetterDateFormat(DateTime date, [String? locale = 'en_US']) {
    var dateString = DateFormat('EEE, MMMM d').format(date);
    final day = dateString.substring(dateString.length - 2);
    switch (day) {
      case ' 1':
        dateString = '${dateString}st';
        break;
      case ' 2':
        dateString = '${dateString}nd';
        break;
      case ' 3':
        dateString = '${dateString}rd';
        break;
      default:
        dateString = '${dateString}th';
    }
    return dateString;
  }

  ///Returns the Date as 'String in ar' Format From the specefied Date
  static String getFullDateTimeInLetterFormat(DateTime date) {
    final dateString = getDateInLetterFormat(date);
    final fullDate = '$dateString  ${getTimeFromDate(date)}';
    return fullDate;
  }

  /// default return date as 'Apr 25, 2023'
  /// you can write what you want on format parameter
  static String getCustomDateFormat(DateTime date,
      [String format = 'EEE dd, yyyy']) {
    var dateString = DateFormat(format).format(date);
    return dateString;
  }
}
