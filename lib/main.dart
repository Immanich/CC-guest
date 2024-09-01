import 'package:citizen_charter/screens/open.dart';
import 'package:citizen_charter/screens/continue.dart';
import 'package:citizen_charter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:citizen_charter/utils/routes.dart';
// import 'utils/routes.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => Open(),
        ...Routes.getRoutes(context),
      },
    );
  }
}
