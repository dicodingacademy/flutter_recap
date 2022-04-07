import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_recap/service/background_service.dart';
import 'package:flutter_recap/utils/date_time_helper.dart';

class AlarmService {
  // random number, dont equal with other ID.
  static const int dailyMessageId = 1;

  final BackgroundService _backgroundService;
  final DateTimeHelper _dateTimeHelper;

  AlarmService(
    this._backgroundService,
    this._dateTimeHelper,
  );

  Future<bool> dailyMessageAlarm() async {
    return await AndroidAlarmManager.periodic(
      const Duration(hours: 24),
      dailyMessageId,
      _backgroundService.callback,
      startAt: _dateTimeHelper.dateAlarm(),
      exact: true,
      wakeup: true,
    );
  }
}
