import 'package:flutter/material.dart';
import 'package:turn_page/global.dart';
import 'package:turn_page/routes/index/index.dart';
import 'package:turn_page/routes/routes.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: staticRoutes,
      home: IndexPage(),
    );
  }
}
