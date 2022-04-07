import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_recap/utils/date_time_helper.dart';
import 'package:flutter_recap/utils/navigator_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_recap/model/detail_page_argument.dart';
import 'package:flutter_recap/page/detail_page.dart';
import 'package:flutter_recap/page/home_page.dart';
import 'package:flutter_recap/provider/database_notifier.dart';
import 'package:flutter_recap/provider/detail_notifier.dart';
import 'package:flutter_recap/provider/home_notifier.dart';
import 'package:flutter_recap/provider/setting_notifier.dart';
import 'package:flutter_recap/service/alarm_service.dart';
import 'package:flutter_recap/service/background_service.dart';
import 'package:flutter_recap/service/database_service.dart';
import 'package:flutter_recap/service/notification_service.dart';
import 'package:flutter_recap/service/shared_preference_service.dart';

final FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BackgroundService.initializeIsolate();

  if (defaultTargetPlatform == TargetPlatform.android) {
    await AndroidAlarmManager.initialize();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// state navigation (provider and bloc)
      providers: [
        ChangeNotifierProvider(create: (_) => HomeNotifier()),
        ChangeNotifierProvider(create: (_) => DetailNotifier()),
        ChangeNotifierProvider(
            create: (_) => DatabaseNotifier(
                  databaseService: DatabaseService(),
                )),
        ChangeNotifierProvider(
            create: (_) => SettingNotifier(
                  SharedPreferenceService(
                    SharedPreferences.getInstance(),
                  ),
                  NotificationService(
                    notificationsPlugin,
                  ),
                  AlarmService(
                    BackgroundService(
                      NotificationService(
                        notificationsPlugin,
                      ),
                    ),
                    DateTimeHelper(),
                  ),
                )),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        /// navigation and route
        navigatorKey: navigatorKey,
        initialRoute: MyHomePage.route,
        routes: {
          MyHomePage.route: (_) => const MyHomePage(),
          DetailPage.route: (context) => DetailPage(
                argument: ModalRoute.of(context)!.settings.arguments
                    as DetailPageArgument,
              ),
        },
      ),
    );
  }
}
