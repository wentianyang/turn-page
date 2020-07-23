import 'package:flutter/material.dart';
import 'package:turn_page/routes/application/application.dart';
import 'package:turn_page/routes/sign_in/sign_in.dart';
import 'package:turn_page/routes/sign_up/sign_up.dart';

/// 静态路由
Map<String, WidgetBuilder> staticRoutes = {
  "/sign-in": (context) => SignInPage(), // 登录
  "/sign-up": (context) => SignUpPage(), // 注册
  "/app": (context) => ApplicationPage(), // 主页
};
