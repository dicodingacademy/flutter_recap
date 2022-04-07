import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_recap/model/detail_page_argument.dart';
import 'package:flutter_recap/page/detail_page.dart';
import 'package:flutter_recap/service/api_service.dart';
import 'package:flutter_recap/utils/navigator_helper.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin;

  NotificationService(this._notificationsPlugin);

  Future<void> initNotifications() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        if (payload != null) {
          // print('notification payload: ' + payload);

          final dogBreed = DetailPageArgument.fromJson(payload);
          if (dogBreed.breed.isNotEmpty) {
            NavigatorHelper.intentWithData(DetailPage.route, dogBreed);
          }
        }
      },
    );
  }

  Future<void> showNotification() async {
    var _channelId = "1";
    var _channelName = "Dog's Breed";
    var _channelDescription = "Dog's Breed";

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: const DefaultStyleInformation(true, true),
    );

    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    var dogList = await ApiService().listDogBreed();
    var dogBreedList = dogList.message.keys.toList();
    var randomIndex = Random().nextInt(dogBreedList.length);
    var randomDogBreed = dogBreedList[randomIndex];

    var titleNotification = "Trending Dog's Breed";
    var bodyNotification = randomDogBreed;

    // id for message. If message show many time, notifications will be stack in notification panel.
    var randomIdMessage = Random().nextInt(100);

    await _notificationsPlugin.show(
      randomIdMessage,
      titleNotification,
      bodyNotification,
      platformChannelSpecifics,
      payload: DetailPageArgument(breed: randomDogBreed).toJson(),
    );
  }
}
