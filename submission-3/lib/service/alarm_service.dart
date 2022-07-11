import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_recap/service/background_service.dart';
import 'package:flutter_recap/utils/date_time_helper.dart';

class AlarmService {
  // random number, dont equal with other ID.
  static const int dailyMessageId = 10;
  final DateTimeHelper _dateTimeHelper;

  AlarmService(
    this._dateTimeHelper,
  );

  Future<bool> dailyMessageAlarm(bool isOn) async {
    if (kDebugMode) {
      print("Alarm is ${isOn ? "on" : "off"}");
    }
    if (isOn) {
      final alarm = await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        dailyMessageId,
        BackgroundService.callback,
        startAt: _dateTimeHelper.dateAlarm(),
        exact: true,
        wakeup: true,
      );
      if (kDebugMode) {
        print("Alarm is ${alarm ? "on" : "off"}");
      }

      return alarm;
    } else {
      return await AndroidAlarmManager.cancel(dailyMessageId);
    }
  }
}
