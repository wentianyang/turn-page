// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes/application/application.dart';
import '../../routes/detail/detail.dart';
import '../../routes/index/index.dart';
import '../../routes/sign_in/sign_in.dart';
import '../../routes/sign_up/sign_up.dart';
import '../../routes/welcome/welcome.dart';
import 'auth_guard.dart';
import 'route.dart';

class Routes {
  static const String indexPage = '/';
  static const String welcomePage = '/welcome-page';
  static const String signInPage = '/sign-in-page';
  static const String signUpPage = '/sign-up-page';
  static const String applicationPage = '/application-page';
  static const String detailPage = '/detail-page';
  static const all = <String>{
    indexPage,
    welcomePage,
    signInPage,
    signUpPage,
    applicationPage,
    detailPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.indexPage, page: IndexPage),
    RouteDef(Routes.welcomePage, page: WelcomePage),
    RouteDef(Routes.signInPage, page: SignInPage),
    RouteDef(Routes.signUpPage, page: SignUpPage),
    RouteDef(Routes.applicationPage, page: ApplicationPage),
    RouteDef(Routes.detailPage, page: DetailPage, guards: [AuthGuard]),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    IndexPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => IndexPage(),
        settings: data,
      );
    },
    WelcomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomePage(),
        settings: data,
      );
    },
    SignInPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInPage(),
        settings: data,
      );
    },
    SignUpPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpPage(),
        settings: data,
      );
    },
    ApplicationPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ApplicationPage(),
        settings: data,
      );
    },
    DetailPage: (data) {
      final args = data.getArgs<DetailPageArguments>(
        orElse: () => DetailPageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => DetailPage(
          key: args.key,
          title: args.title,
          url: args.url,
        ),
        settings: data,
        transitionsBuilder: zoomInTransition,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// DetailPage arguments holder class
class DetailPageArguments {
  final Key key;
  final String title;
  final String url;
  DetailPageArguments({this.key, this.title, this.url});
}
