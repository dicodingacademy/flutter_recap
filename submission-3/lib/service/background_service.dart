import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_recap/service/notification_service.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static SendPort? _uiSendPort;
  static const String _isolateName = 'isolate';

  static void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static void callback() {
    if (kDebugMode) {
      print("Alarm is start");
    }

    NotificationService.showNotification();

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
