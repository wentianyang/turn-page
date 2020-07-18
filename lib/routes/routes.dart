import 'package:flutter/material.dart';
import 'package:turn_page/routes/sign_in/sign_in.dart';
import 'package:turn_page/routes/sign_up/sign_up.dart';

/// 静态路由
Map<String, WidgetBuilder> staticRoutes = {
  "/sign-in": (context) => SignInPage(),
  "/sign-up": (context) => SignUpPage(),
};
