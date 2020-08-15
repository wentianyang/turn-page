import 'package:auto_route/auto_route.dart';
import 'package:turn_page/common/route/route.gr.dart';
import 'package:turn_page/common/utils/authentication.dart';

/// 路由拦截登录判断
class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState<RouterBase> navigator,
      String routeName, Object arguments) async {
    var isAuth = await isAuthenticated();
    if (!isAuth) {
      ExtendedNavigator.root.push(Routes.signInPage);
    }
    return isAuth;
  }
}
