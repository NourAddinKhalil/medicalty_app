import 'package:medicalty/helpers/enums.dart';

class WeekDaysClass {
  final WeekDayEnum id;
  final String name;
  final bool hide;
  WeekDaysClass({
    required this.id,
    required this.name,
    this.hide = false,
  });

  WeekDaysClass copyWith({
    WeekDayEnum? id,
    String? name,
    bool? hide,
  }) {
    return WeekDaysClass(
      id: id ?? this.id,
      name: name ?? this.name,
      hide: hide ?? this.hide,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeekDaysClass &&
        other.id == id &&
        other.name == name &&
        other.hide == hide;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ hide.hashCode;

  @override
  String toString() => 'WeekDaysClass(id: $id, name: $name, hide: $hide)';
}

final weekDaysList = [
  WeekDaysClass(
    id: WeekDayEnum.saturday,
    name: 'Saturday',
  ),
  WeekDaysClass(
    id: WeekDayEnum.sunday,
    name: 'Sunday',
  ),
  WeekDaysClass(
    id: WeekDayEnum.monday,
    name: 'Monday',
  ),
  WeekDaysClass(
    id: WeekDayEnum.tuesday,
    name: 'Tuesday',
  ),
  WeekDaysClass(
    id: WeekDayEnum.wednesday,
    name: 'Wednesday',
  ),
  WeekDaysClass(
    id: WeekDayEnum.thursday,
    name: 'Thursday',
  ),
  WeekDaysClass(
    id: WeekDayEnum.friday,
    name: 'Friday',
  ),
];
