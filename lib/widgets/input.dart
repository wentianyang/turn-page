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
