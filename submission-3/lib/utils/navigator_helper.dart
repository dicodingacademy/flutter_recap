import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
 
class NavigatorHelper{
  static intentWithData(String routeName, Object? arguments) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }
 
  static back() => navigatorKey.currentState?.pop();

}