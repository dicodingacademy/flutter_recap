import 'package:flutter/material.dart';
import 'package:flutter_recap/domain/entity/detail_page_argument.dart';
import 'package:flutter_recap/presentation/page/detail_page.dart';
import 'package:flutter_recap/presentation/page/home_page.dart';
import 'package:flutter_recap/presentation/page/unknown_page.dart';

part 'route_name_helper.dart';

class RouteHelper {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    final routeName = settings?.name;
    final arguments = settings?.arguments;

    switch (routeName) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(),
          settings: settings,
        );
      case detailRoute:
        if (arguments is DetailPageArgument) {
          return MaterialPageRoute(
            builder: (context) => DetailPage(
              argument: arguments,
            ),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (context) => const UnknownPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const UnknownPage(),
        );
    }
  }
}


