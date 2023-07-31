import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/helpers/convert_to_date_time.dart';

class Validators {
  static String? validateNameField(String? value) {
    var empty = checkIfNotEmpty(value);
    if (empty != null) {
      return empty;
    }
    if (value!.length < 8) {
      return 'يجب أن يحتوي الإسم 8 حروف على الأقل';
    }
    return null;
  }

  static String? validatePasswordField(String? value, [String? otherPassword]) {
    var empty = checkIfNotEmpty(value);
    if (empty != null) {
      return empty;
    }
    if (value!.length < 8) {
      return 'Password shuold have at least 8 character';
    }
    if (otherPassword != null) {
      if (value != otherPassword) {
        return 'Confirmation must match password field!';
      }
    }
    return null;
  }

  static String? validateDateFormat(String? value) {
    var empty = checkIfNotEmpty(value);
    if (empty != null) {
      return empty;
    }
    try {
      DateTimeHelpers.convertStringToDate(value!);

      return null;
    } catch (_) {
      return 'Enter a valid date!';
    }
  }

  static String? validateURL(String? value, [bool allownNll = true]) {
    var empty = checkIfNotEmpty(value);
    if (empty != null) {
      if (allownNll) return null;
      return empty;
    }
    try {
      final res = Uri.tryParse(value!);
      if (!(res?.hasAbsolutePath ?? false)) {
        return 'Enter a valid url';
      }

      return null;
    } catch (_) {
      return 'Enter a valid date!';
    }
  }

  static String? validateDateField(String? value, [bool allownNll = false]) {
    var empty = checkIfNotEmpty(value);
    if (empty != null) {
      if (allownNll) return null;
      return empty;
    }
    try {
      final fdate = DateTimeHelpers.convertStringToDate(value!);

      if (!DateTimeHelpers.isDateNOWAfter(fdate)) {
        return null;
      }
      return 'تاريخ اليوم أكبر من التاريخ المدخل';
    } catch (_) {
      return 'Enter a valid date!';
    }
  }

  static String? validateTimeField(String? value, String dateController) {
    var empty = checkIfNotEmpty(value);
    if (empty != null) {
      return empty;
    }
    try {
      final fdate = DateTimeHelpers.convertStringToDate(dateController);

      final time = DateTimeHelpers.convertToTimeOfDayV2(value!);

      final date = DateTimeHelpers.convertToDateTime(fdate, time);
      if (!DateTimeHelpers.isDateTimeNOWAfter(date)) {
        return null;
      }
      return 'توقيت الآن أكبر من التوقيت المدخل';
    } catch (e) {
      return 'Enter a valid time!';
    }
  }

  static String? validateTimeFormat(String? value) {
    var empty = checkIfNotEmpty(value);
    if (empty != null) {
      return empty;
    }
    try {
      DateTimeHelpers.convertToTimeOfDayV2(value!);

      return null;
    } catch (_) {
      return 'Enter a valid Time!';
    }
  }

  static String? validateNumberField(String? value,
      [bool allowNull = false, bool showMessage = true]) {
    var empty = checkIfNotEmpty(value);
    if (empty != null) {
      if (allowNull) return null;
      return showMessage ? empty : '';
    }
    if (!value!.contains(RegExp(r'[0-9]'))) {
      return showMessage ? 'Enter a valid number!' : '';
    }
    return null;
  }

  static String? validateMoneyField(String? value,
      [bool allowZero = true, bool allowNull = false]) {
    var empty = validateNumberField(value);
    if (empty != null) {
      return allowNull ? null : empty;
    }
    if (value!.contains('\$') || value.contains(',')) {
      value = value.substring(1).replaceAll(',', '');
    }
    try {
      var valDouble = double.parse(value);
      if (valDouble == 0 && !allowZero) {
        return "This field need to be a more than zero";
      }
      if (valDouble < 0) {
        return "This field can't be a negative value";
      }
      return null;
    } on Exception catch (_) {
      return 'This field must contains only numbers';
    }
  }

  static String? validatePhoneNumberField(String? value, [int atLeastNum = 9]) {
    var empty = checkIfNotEmpty(value);
    if (empty != null) {
      return empty;
    }
    var isNumber = validateNumberField(value);
    if (isNumber != null) {
      return isNumber;
    } else {
      if (value!.length < atLeastNum) {
        return 'This field must contain at least $atLeastNum numbers!';
      }
      return null;
    }
  }

  static String? checkIfNotEmpty(String? value) {
    if (value != null && value.trim().isNotEmpty && value != '') {
      return null;
    }
    return 'This field can not be empty!';
  }

  static String? checkIfValuesEqual<T>(T? value, T otherValue,
      [String typeName = 'item']) {
    String? empty;
    if (T is String) {
      empty = checkIfNotEmpty(value.toString());
    } else if (value == null) {
      empty = 'This field can not be empty!';
    }
    if (empty != null) {
      return empty;
    }

    if (value != otherValue) {
      return 'Please select $typeName from list!';
    }

    return null;
  }

  static String? validateEmail(String? email) {
    var empty = checkIfNotEmpty(email);
    if (empty != null) {
      return empty;
    }
    if (!EmailValidator.validate(email!)) {
      return 'Email Not Valid';
    }

    return null;
  }

  static String? validateListsField<DataType>(
    String? value,
    List<TextEditingController>? otherControlersValues,
    String typeName,
    bool allowNullValue,
    List<DataType>? fieldList,
  ) {
    if (fieldList == null) return null;
    if (value != null && value.isNotEmpty && value != '') {
      for (var i = 0; i < (otherControlersValues?.length ?? 0); i++) {
        if (otherControlersValues![i].text.trim() == value.trim()) {
          return '$typeName already exists on another fields!';
        }
      }

      if (fieldList.contains(value)) {
        return null;
      } else {
        return 'Please write $typeName that exist on the list!';
      }
    }
    if (allowNullValue) {
      return null;
    }
    return 'This field can not be empty!';
  }
}
