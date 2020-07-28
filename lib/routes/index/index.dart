import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_page/global.dart';
import 'package:turn_page/routes/application/application.dart';
import 'package:turn_page/routes/sign_in/sign_in.dart';
import 'package:turn_page/routes/welcome/welcome.dart';

/// 引导页面
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    // 屏幕适配(初始化设计稿的比例)
    ScreenUtil.init(
      width: 375,
      height: 812 - 44 - 34,
      allowFontScaling: true,
    );
    return Scaffold(
      body: Global.isFirstOpen
          ? WelcomePage()
          : Global.isOfflineLogin ? ApplicationPage() : SignInPage(),
    );
  }
}
