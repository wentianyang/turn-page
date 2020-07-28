import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turn_page/common/utils/screen.dart';
import 'package:turn_page/common/values/radii.dart';
import 'package:turn_page/common/values/values.dart';

Widget inputTextEdit(
    {@required TextEditingController controller,
    String hintText,
    double height = 44,
    Color backgroundColor = AppColors.secondaryElement,
    Color textColor = AppColors.primaryText,
    double fontSize,
    double marginTop = 0,
    TextInputType inputType = TextInputType.text,
    bool isPassword = false,
    BorderRadiusGeometry border = Radii.k6pxRadius}) {
  return Container(
    height: duSetHeight(height),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    decoration: BoxDecoration(color: backgroundColor, borderRadius: border),
    child: TextField(
      controller: controller,
      keyboardType: inputType,
      maxLines: 1,
      autocorrect: false,
      obscureText: isPassword,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontFamily: "Avenir",
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10)),
    ),
  );
}

/// email 输入框
/// 背景白色，文字黑色，带阴影
Widget inputEmailEdit({
  @required TextEditingController controller,
  double marginTop,
  bool autofocus = false,
  bool isPassword = false,
  String hintText,
  TextInputType inputType = TextInputType.emailAddress,
}) {
  return Container(
    height: duSetHeight(44),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    decoration: BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: Radii.k6pxRadius,
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(41, 0, 0, 0),
            offset: Offset(0, 1),
            blurRadius: 0),
      ],
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: AppColors.primaryText,
        ),
      ),
      style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.w400,
          fontSize: duSetFontSize(18)),
      maxLines: 1,
      autocorrect: false,
      obscureText: isPassword,
    ),
  );
}
