import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:turn_page/common/utils/screen.dart';
import 'package:turn_page/common/values/colors.dart';
import 'package:turn_page/widgets/button.dart';
import 'package:turn_page/widgets/input.dart';
import 'package:turn_page/widgets/toast.dart';

/// 邮件订阅
Widget newSletterWidget() {
  return Container(
    height: duSetHeight(289),
    padding:
        EdgeInsets.fromLTRB(duSetWidth(20), duSetWidth(20), duSetWidth(20), 0),
    color: AppColors.secondaryElement,
    child: Column(
      children: <Widget>[
        // 顶部
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // 订阅文字
            Text("Newsletter"),
            InkWell(child: Icon(Icons.close), onTap: () {})
          ],
        ),
        // email输入框
        inputEmailEdit(
          marginTop: 40,
          hintText: "Email",
          controller: null,
        ),
        // 订阅按钮
        textFlatButton(
          title: "Subscribe",
          width: 400,
          marginTop: 30,
          background: AppColors.secondaryElementText,
          onPressed: () {},
        ),
        // 底部文字
        Container(
          margin: EdgeInsets.only(top: duSetHeight(30)),
          padding: EdgeInsets.symmetric(horizontal: duSetWidth(40)),
          child: Text.rich(TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'By clicking on Subscribe button you agree to accept',
                  style: TextStyle(
                      color: AppColors.thirdElementText,
                      fontSize: duSetFontSize(14),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Avenir")),
              TextSpan(
                text: ' Privacy Policy',
                style: TextStyle(
                    color: AppColors.secondaryElementText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                    fontSize: duSetFontSize(14)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    toast(msg: 'Privacy Policy');
                  },
              )
            ],
          )),
        )
      ],
    ),
  );
}
