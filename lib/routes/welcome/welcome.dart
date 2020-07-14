import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:turn_page/common/utils/utils.dart';
import 'package:turn_page/common/values/colors.dart';
import 'package:turn_page/common/values/values.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  /// 页头标题
  Widget _buildPageHeaderTitle() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(60)),
      child: Text(
        "Features",
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: duSetFontSize(24),
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600),
      ),
    );
  }

  /// 页头说明
  Widget _buildPageHeaderDetail() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(24)),
      height: duSetHeight(70),
      width: duSetWidth(242),
      child: Text(
        "The best of news channels all in one place. Trusted sources and personalized news for you.",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Avenir",
            fontSize: duSetFontSize(16),
            fontWeight: FontWeight.normal,
            height: 1.2),
      ),
    );
  }

  /// 特性说明
  Widget _buildFeatureItem(String image, String intro, double margin) {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(80),
      margin: EdgeInsets.only(top: duSetHeight(margin)),
      child: Row(
        children: <Widget>[
          Container(
            width: duSetWidth(80),
            height: duSetHeight(80),
            child: Image.asset(
              "assets/images/$image.png",
              fit: BoxFit.none,
            ),
          ),
          Spacer(),
          Container(
            width: duSetWidth(195),
            child: Text(intro,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontSize: duSetFontSize(16),
                    fontWeight: FontWeight.normal)),
          )
        ],
      ),
    );
  }

  /// 开始按钮
  Widget _buildStartButton() {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(44),
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: FlatButton(
          color: AppColors.primaryElement,
          textColor: AppColors.primaryElementText,
          child: Text("Get Start"),
          shape: RoundedRectangleBorder(borderRadius: Radii.k6pxRadius),
          onPressed: () {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 适配屏幕
    ScreenUtil.init(width: 375, height: 812 - 44 - 34, allowFontScaling: true);

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            _buildPageHeaderTitle(),
            _buildPageHeaderDetail(),
            _buildFeatureItem(
                "feature-1",
                "Compelling photography and typography provide a beautiful reading",
                88),
            _buildFeatureItem(
                "feature-2",
                "Sector news never shares your personal data with advertisers or publishers",
                40),
            _buildFeatureItem("feature-3",
                "You can get Premium to unlock hundreds of publications", 40),
            Spacer(),
            _buildStartButton()
          ],
        ),
      ),
    );
  }
}
