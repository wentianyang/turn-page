import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turn_page/common/provider/app.dart';
import 'package:turn_page/common/route/auth_guard.dart';
import 'package:turn_page/common/route/route.gr.dart';
import 'package:turn_page/global.dart';
import 'package:turn_page/routes/index/index.dart';
import 'package:turn_page/routes/routes.dart';

void main() => Global.init().then((e) => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>.value(value: Global.appState)
      ],
      child: Consumer<AppState>(builder: (context, appState, _) {
        if (appState.isGrayFilter) {
          return ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
            child: MyApp(),
          );
        } else {
          return MyApp();
        }
      }),
    )));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: staticRoutes,
      home: IndexPage(),
      builder: ExtendedNavigator.builder<AppRouter>(
        router: AppRouter(),
        initialRoute: Routes.indexPage,
        guards: [AuthGuard()],
      ),
    );
  }
}
