import 'package:flutter/material.dart';
import '../screens/continue.dart';
import '../screens/home.dart';
import '../screens/events.dart';
import '../screens/notifications.dart';
import '../screens/profile.dart';
import '../screens/bottom_navigation.dart';
import '../screens/accounting_services.dart';

class Routes {
  static const String continue_page = '/continue';
  static const String home = '/home';
  static const String events = '/events';
  static const String notifications = '/notifications';
  static const String profile = '/profile';
  static const String bottom_nav = '/bottom_nav';
  static const String accounting_services = '/accounting_services';

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      continue_page: (context) => Continue(),
      bottom_nav: (context) => BottomNavigationBarApp(),
      home: (context) => Home(),
      events: (context) => Events(),
      notifications: (context) => Notifications(),
      profile: (context) => Profile(),
      // events: (context) => EventPage(),
      accounting_services: (context) => AccountingServices(),
    };
  }
}
