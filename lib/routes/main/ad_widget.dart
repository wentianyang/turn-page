import 'package:flutter/cupertino.dart';
import 'package:turn_page/common/utils/screen.dart';
import 'package:turn_page/common/values/colors.dart';
import 'package:turn_page/common/values/values.dart';

/// 广告
Widget adWidget() {
  return Container(
    alignment: Alignment.center,
    height: duSetHeight(100),
    padding: EdgeInsets.all(duSetWidth(20)),
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: duSetWidth(20),
      ),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(Borders.primaryBorder),
          borderRadius: Radii.k6pxRadius),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Tired of Ads? Get Premium - \$9.99",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: duSetFontSize(18.0)),
          )
        ],
      ),
    ),
  );
}
