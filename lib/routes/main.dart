import 'package:flutter/material.dart';
import 'package:turn_page/routes/routes.dart';
import 'package:turn_page/routes/welcome/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: staticRoutes,
      home: WelcomePage(),
    );
  }
}
