import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:turn_page/common/route/auth_guard.dart';
import 'package:turn_page/routes/application/application.dart';
import 'package:turn_page/routes/detail/detail.dart';
import 'package:turn_page/routes/index/index.dart';
import 'package:turn_page/routes/sign_in/sign_in.dart';
import 'package:turn_page/routes/sign_up/sign_up.dart';
import 'package:turn_page/routes/welcome/welcome.dart';

// 转场动画
Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return ScaleTransition(
    scale: animation,
    child: child,
  );
}

// $ 标记要做代码自动生成的类
// 路由表
@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: IndexPage, initial: true),
  MaterialRoute(page: WelcomePage),
  MaterialRoute(
    page: SignInPage,
  ),
  MaterialRoute(
    page: SignUpPage,
  ),
  MaterialRoute(
    page: ApplicationPage,
  ),
  // MaterialRoute(
  //   page: DetailPage,
  //   guards: [AuthGuard],
  // ),
  CustomRoute(
    page: DetailPage,
    guards: [AuthGuard],
    transitionsBuilder: zoomInTransition,
  )
])
class $AppRouter {}
