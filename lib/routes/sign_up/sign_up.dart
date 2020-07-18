import 'package:flutter/material.dart';
import 'package:turn_page/common/utils/screen.dart';
import 'package:turn_page/common/utils/validator.dart';
import 'package:turn_page/common/values/colors.dart';
import 'package:turn_page/widgets/app.dart';
import 'package:turn_page/widgets/button.dart';
import 'package:turn_page/widgets/input.dart';
import 'package:turn_page/widgets/toast.dart';

/// 注册页
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //
  final TextEditingController _fullNameController = TextEditingController();
  // 邮箱
  final TextEditingController _emailController = TextEditingController();
  // 密码
  final TextEditingController _passwordController = TextEditingController();

  // 已有帐号
  _handleNavPop() {
    Navigator.pop(context);
  }

  // 创建帐号验证
  _buildCreateAccount() {
    if (!duCheckStringLength(_fullNameController.value.text, 5)) {
      toast(msg: "用户名至少要5个字符");
      return;
    }
    if (!duIsEmail(_emailController.value.text)) {
      toast(msg: "邮箱格式错误");
      return;
    }
    if (!duCheckStringLength(_passwordController.value.text, 8)) {
      toast(msg: "密码不能小宇8位字符");
      return;
    }
  }

  // 注册页logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(40.0)),
      child: Text(
        "Sign up",
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 20,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600),
      ),
    );
  }

  // 注册表单
  Widget _buildInputform() {
    return Container(
      width: duSetWidth(295),
      child: Column(
        children: <Widget>[
          inputTextEdit(
              controller: _fullNameController,
              hintText: "Full name",
              marginTop: 50),
          inputTextEdit(
              controller: _emailController, hintText: "Email", marginTop: 20),
          inputTextEdit(
              controller: _passwordController,
              hintText: "Password",
              isPassword: true,
              marginTop: 20),
          textFlatButton(
              onPressed: _buildCreateAccount,
              marginTop: 20,
              width: 295,
              height: 44,
              titleSize: 16,
              background: AppColors.primaryElement,
              title: "Create an account "),
          FlatButton(
              onPressed: _buildCreateAccount,
              child: Text(
                "Forgot password?",
                style: TextStyle(
                    color: AppColors.primaryElement,
                    fontSize: duSetFontSize(12)),
              ))
        ],
      ),
    );
  }

  /// 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(40.0)),
      child: Column(
        children: <Widget>[
          Text(
            "Or sign in with social networks",
            style: TextStyle(
                fontSize: duSetFontSize(14.0),
                fontWeight: FontWeight.w400,
                color: AppColors.primaryText),
          ),
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: <Widget>[
                iconButton(onPressed: () {}, iconName: "icons-google"),
                Spacer(),
                iconButton(onPressed: () {}, iconName: "icons-twitter"),
                Spacer(),
                iconButton(onPressed: () {}, iconName: "icons-facebook"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 有帐号
  Widget _buildHaveAccountButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: duSetHeight(30.0)),
      child: textFlatButton(
          onPressed: _handleNavPop,
          width: 295,
          title: "I have an account",
          titleSize: 16,
          textColor: AppColors.primaryText,
          background: AppColors.secondaryElement),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppbar(context: context, actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toast(msg: "这是注册界面");
            })
      ]),
      body: Center(
        child: Column(
          children: <Widget>[
            _buildLogo(),
            _buildInputform(),
            _buildThirdPartyLogin(),
            Spacer(),
            _buildHaveAccountButton()
          ],
        ),
      ),
    );
  }
}
