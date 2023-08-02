import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalty/controllers/helpers_controller.dart';
import 'package:medicalty/helpers/convert_to_date_time.dart';
import 'package:medicalty/helpers/enums.dart';
import 'package:medicalty/helpers/enums_helpers/week_days_helpers.dart';
import 'package:medicalty/models/department_model.dart';
import 'package:medicalty/models/employee_model.dart';

class EmployeeScreenController extends HelpersController {
  final belongsToTxtField = TextEditingController();
  final birthDateTxtField = TextEditingController();
  final workingTimeTxtField = TextEditingController();
  final hourlySalaryTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final totalSalaryTxtField = CurrencyTextFieldController(
    decimalSymbol: '.',
    thousandSymbol: ',',
    initDoubleValue: 0.00,
    enableNegative: false,
    currencySymbol: '\$',
  );
  final nameTxtField = TextEditingController();
  final usernameTxtField = TextEditingController();
  final List<List<TextEditingController>> weekDaysControllers = [];
  final weekDaysScheduleList = [...weekDaysList];
  final List<Function(String? value)> weekDaysSaveList = [];

  var model = EmployeeModel.defaultModel;

  @override
  void onInit() {
    _generateWeekDaysControllers();
    _generateWeekDaSaveFunction();
    super.onInit();
  }

  void _generateWeekDaysControllers() {
    final length = weekDaysScheduleList.length;
    for (int i = 0; i < length; i++) {
      weekDaysControllers.add(
        [TextEditingController(), TextEditingController()],
      );
    }
  }

  void _generateWeekDaSaveFunction() {
    for (var element in weekDaysScheduleList) {
      switch (element.id) {
        case WeekDayEnum.saturday:
          weekDaysSaveList.add((value) {
            final startTime = weekDaysControllers[element.id.index][0];
            final endTime = weekDaysControllers[element.id.index][1];
            model = model.copyWith(
              saturdayStartTime:
                  DateTimeHelpers.convertToTimeOfDayV2(startTime.text),
              saturdayEndTime:
                  DateTimeHelpers.convertToTimeOfDayV2(endTime.text),
            );
          });
          break;
        case WeekDayEnum.sunday:
          weekDaysSaveList.add((value) {
            final startTime = weekDaysControllers[element.id.index][0];
            final endTime = weekDaysControllers[element.id.index][1];
            model = model.copyWith(
              sundayStartTime:
                  DateTimeHelpers.convertToTimeOfDayV2(startTime.text),
              sundayEndTime: DateTimeHelpers.convertToTimeOfDayV2(endTime.text),
            );
          });
          break;
        case WeekDayEnum.monday:
          weekDaysSaveList.add((value) {
            final startTime = weekDaysControllers[element.id.index][0];
            final endTime = weekDaysControllers[element.id.index][1];
            model = model.copyWith(
              mondayStartTime:
                  DateTimeHelpers.convertToTimeOfDayV2(startTime.text),
              mondayEndTime: DateTimeHelpers.convertToTimeOfDayV2(endTime.text),
            );
          });
          break;
        case WeekDayEnum.tuesday:
          weekDaysSaveList.add((value) {
            final startTime = weekDaysControllers[element.id.index][0];
            final endTime = weekDaysControllers[element.id.index][1];
            model = model.copyWith(
              tuesdayStartTime:
                  DateTimeHelpers.convertToTimeOfDayV2(startTime.text),
              tuesdayEndTime:
                  DateTimeHelpers.convertToTimeOfDayV2(endTime.text),
            );
          });
          break;
        case WeekDayEnum.wednesday:
          weekDaysSaveList.add((value) {
            final startTime = weekDaysControllers[element.id.index][0];
            final endTime = weekDaysControllers[element.id.index][1];
            model = model.copyWith(
              wednesdayStartTime:
                  DateTimeHelpers.convertToTimeOfDayV2(startTime.text),
              wednesdayEndTime:
                  DateTimeHelpers.convertToTimeOfDayV2(endTime.text),
            );
          });
          break;
        case WeekDayEnum.thursday:
          weekDaysSaveList.add((value) {
            final startTime = weekDaysControllers[element.id.index][0];
            final endTime = weekDaysControllers[element.id.index][1];
            model = model.copyWith(
              thursdayStartTime:
                  DateTimeHelpers.convertToTimeOfDayV2(startTime.text),
              thursdayEndTime:
                  DateTimeHelpers.convertToTimeOfDayV2(endTime.text),
            );
          });
          break;
        case WeekDayEnum.friday:
          weekDaysSaveList.add((value) {
            final startTime = weekDaysControllers[element.id.index][0];
            final endTime = weekDaysControllers[element.id.index][1];
            model = model.copyWith(
              fridayStartTime:
                  DateTimeHelpers.convertToTimeOfDayV2(startTime.text),
              fridayEndTime: DateTimeHelpers.convertToTimeOfDayV2(endTime.text),
            );
          });
          break;
        default:
      }
    }
  }

  void hideDay(WeekDaysClass day) {
    final index = weekDaysScheduleList.indexOf(day);
    day = day.copyWith(hide: true);
    weekDaysScheduleList[index] = day;
    update([day.name]);
  }

  void showDay(WeekDaysClass day) {
    final index = weekDaysScheduleList.indexOf(day);
    day = day.copyWith(hide: false);
    weekDaysScheduleList[index] = day;
    update([day.name]);
  }

  String _image = '';
  String get image => _image;
  void onImageChoosen(String? image) {
    _image = image ?? '';
    model = model.copyWith(
      image: _image,
    );
    update(['image']);
  }

  void onDepartmentSelected(DepartmentModel selected) {
    belongsToTxtField.text = selected.name;
    model = model.copyWith(departmentId: selected.id);
    update(['department']);
  }

  void onWorkingTimesSelected(WorkingTimesEnum selected) {
    workingTimeTxtField.text = selected.name;
    model = model.copyWith(workingTime: selected.name);
    update(['working_times']);
  }

  @override
  void dispose() {
    birthDateTxtField.dispose();
    workingTimeTxtField.dispose();
    belongsToTxtField.dispose();
    hourlySalaryTxtField.dispose();
    totalSalaryTxtField.dispose();
    nameTxtField.dispose();
    usernameTxtField.dispose();
    super.dispose();
  }
}
