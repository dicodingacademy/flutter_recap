import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_recap/main.dart';
import 'package:flutter_recap/model/detail_page_argument.dart';
import 'package:flutter_recap/page/detail_page.dart';
import 'package:flutter_recap/service/api_service.dart';
import 'package:flutter_recap/utils/navigator_helper.dart';

class NotificationService {

  NotificationService();

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

    await notificationsPlugin.initialize(
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

  static Future<void> showNotification() async {
    var channelId = "1";
    var channelName = "Dog's Breed";
    var channelDescription = "Dog's Breed";

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
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

    // get Dog's Breed List
    var dogList = await ApiService().listDogBreed();
    var dogBreedList = dogList.message.keys.toList();

    // get random breed item from list
    var randomIndex = Random().nextInt(dogBreedList.length);
    var randomDogBreed = dogBreedList[randomIndex];

    // set notification information
    var titleNotification = "Trending Dog's Breed";
    var bodyNotification = randomDogBreed;

    // id for message. If message show many time, notifications will be stack in notification panel.
    var randomIdMessage = Random().nextInt(100);

    await notificationsPlugin.show(
      randomIdMessage,
      titleNotification,
      bodyNotification,
      platformChannelSpecifics,
      payload: DetailPageArgument(breed: randomDogBreed).toJson(),
    );
  }
}
