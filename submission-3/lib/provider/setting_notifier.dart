import 'package:flutter/material.dart';
import 'package:flutter_recap/service/alarm_service.dart';
import 'package:flutter_recap/service/notification_service.dart';
import 'package:flutter_recap/service/shared_preference_service.dart';

class SettingNotifier extends ChangeNotifier {
  final SharedPreferenceService _preferenceService;
  final NotificationService _notificationService;
  final AlarmService _alarmService;

  SettingNotifier(
    this._preferenceService,
    this._notificationService,
    this._alarmService,
  ) {
    _notificationService.initNotifications();
  }

  bool _isDailyMessageOn = false;
  bool get isDailyMessageOn => _isDailyMessageOn;

  void setDailyMessage(bool value) {
    _isDailyMessageOn = value;
    _preferenceService.setDailyMessage(value);

    // _notificationService.showNotification();
    _alarmService.dailyMessageAlarm();

    notifyListeners();
  }

  Future<void> getDailyMessage() async {
    _isDailyMessageOn = await _preferenceService.isDailyMessageOn;
    notifyListeners();
  }
}
