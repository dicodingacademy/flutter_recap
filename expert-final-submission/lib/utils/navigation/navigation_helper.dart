import 'package:flutter/material.dart';

class NavigationHelper {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic>? navigateAndRemoveUntil(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  static goBack([dynamic value]) {
    return navigatorKey.currentState?.pop(value);
  }
}
