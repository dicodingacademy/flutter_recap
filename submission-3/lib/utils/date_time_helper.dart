import 'package:flutter/foundation.dart';

class DateTimeHelper {
  DateTime dateAlarm() {
    const hourAlarm = 11;
    const minuteAlarm = 0;
    final dateTimeNow = DateTime.now();
    final dateTimeAlarmToday = DateTime(
      dateTimeNow.year,
      dateTimeNow.month,
      dateTimeNow.day,
      kDebugMode ? dateTimeNow.hour : hourAlarm,
      kDebugMode ? dateTimeNow.minute + 1 : minuteAlarm,
      kDebugMode ? dateTimeNow.minute : 0,
    );

    final dateTimeAlarmNextDay = dateTimeAlarmToday.add(
      const Duration(days: 1),
    );

    final dateTimeAlarm = dateTimeNow.isBefore(dateTimeAlarmToday)
        ? dateTimeAlarmToday
        : dateTimeAlarmNextDay;

    if (kDebugMode) {
      print("Alarm at: $dateTimeAlarm");
    }

    return dateTimeAlarm;
  }
}
