import 'package:flutter/material.dart';
import 'package:flutter_recap/page/detail_page.dart';
import 'package:flutter_recap/page/home_page.dart';
import 'package:flutter_recap/provider/detail_notifier.dart';
import 'package:flutter_recap/provider/home_notifier.dart';
import 'package:provider/provider.dart';

void main() {
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        /// navigation and route
        initialRoute: MyHomePage.route,
        routes: {
          MyHomePage.route: (_) => const MyHomePage(),
          DetailPage.route: (context) => DetailPage(
                argument: ModalRoute.of(context)!.settings.arguments as DetailPageArgument,
              ),
        },
      ),
    );
  }
}
