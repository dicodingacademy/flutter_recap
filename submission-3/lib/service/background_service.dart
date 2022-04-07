import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_recap/service/notification_service.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static SendPort? _uiSendPort;
  static const String _isolateName = 'isolate';

  final NotificationService _notificationService;

  BackgroundService(this._notificationService);

  static void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  void callback() {
    _notificationService.showNotification();

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
