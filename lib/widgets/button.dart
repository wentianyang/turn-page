import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:turn_page/common/utils/utils.dart';
import 'package:turn_page/common/values/values.dart';

/// 文字按钮
Widget textFlatButton(
    {double width = 100,
    double height = 44,
    double marginTop = 0,
    Color background,
    Brightness colorBrightness,
    double borderRadius = 4,
    String title = "",
    double titleSize = 18.0,
    Color textColor = AppColors.primaryElementText,
    @required VoidCallback onPressed}) {
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    child: FlatButton(
        onPressed: onPressed,
        color: background,
        colorBrightness: colorBrightness,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Text(
          title,
          style: TextStyle(
              color: textColor,
              letterSpacing: 2,
              fontSize: duSetFontSize(titleSize)),
        )),
  );
}

/// 图标按钮
Widget iconButton(
    {@required VoidCallback onPressed,
    double width = 88.0,
    double height = 44.0,
    String iconName}) {
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: OutlineButton(
      onPressed: onPressed,
      child: Image.asset(
        "assets/images/$iconName.png",
      ),
    ),
  );
}
