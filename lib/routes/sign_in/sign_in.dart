import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:turn_page/common/api/api.dart';
import 'package:turn_page/common/entity/entities.dart';
import 'package:turn_page/common/utils/screen.dart';
import 'package:turn_page/common/utils/utils.dart';
import 'package:turn_page/common/values/colors.dart';
import 'package:turn_page/common/values/shadows.dart';
import 'package:turn_page/global.dart';
import 'package:turn_page/widgets/button.dart';
import 'package:turn_page/widgets/input.dart';
import 'package:turn_page/widgets/toast.dart';

/// 登录页
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // email控制器
  final TextEditingController _emailController = new TextEditingController();
  // password控制器
  final TextEditingController _passwordController = new TextEditingController();

  // 登录验证
  _handlerSignIn() async {
    if (!duIsEmail(_emailController.value.text)) {
      toast(msg: "邮箱格式不正确...");
      return;
    }
    // 验证密码
    if (!duCheckStringLength(_passwordController.value.text, 6)) {
      toast(msg: "密码不能小于6位...");
      return;
    }

    UserLoginRequestEntity userRequestEntity = new UserLoginRequestEntity(
        email: _emailController.value.text,
        password: duSHA256(_passwordController.value.text));
    UserLoginResponseEntity response =
        await UserAPI.login(params: userRequestEntity);
    Global.saveProfile(response);
    print("user login response ${response.toJson()}");
  }

  // 注册跳转
  _handleNavSignup() {
    Navigator.pushNamed(context, "/sign-up");
  }

  // logo
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(110),
      margin: EdgeInsets.only(top: duSetHeight(44 + 40.0)),
      child: Column(
        // 设置纵轴对其方式
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // logo
          Container(
            height: duSetHeight(80),
            margin: EdgeInsets.symmetric(horizontal: duSetWidth(20)),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
                      height: duSetHeight(80),
                      decoration: BoxDecoration(
                          color: AppColors.primaryBackground,
                          boxShadow: [Shadows.primaryShadow],
                          borderRadius: BorderRadius.all(
                              Radius.circular(duSetWidth(80 * 0.5)))),
                      child: Container(),
                    )),
                Positioned(
                    child: Image.asset(
                  "assets/images/logo.png",
                  width: duSetWidth(40),
                  height: duSetHeight(40),
                  fit: BoxFit.contain,
                ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 14),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: duSetFontSize(24),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  height: 1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(2)),
            child: Text(
              "news",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: duSetFontSize(16),
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }

  /// 登录表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      child: Column(
        children: <Widget>[
          // 账号
          inputTextEdit(
              controller: _emailController,
              hintText: "Email",
              inputType: TextInputType.emailAddress,
              marginTop: 50),
          // 密码
          inputTextEdit(
              controller: _passwordController,
              hintText: "Password",
              isPassword: true,
              marginTop: 20),
          // 注册 登录按钮
          Row(
            children: <Widget>[
              // 注册
              textFlatButton(
                  onPressed: _handleNavSignup,
                  width: 140,
                  height: 44,
                  marginTop: 20,
                  background: AppColors.thirdElement,
                  colorBrightness: Brightness.dark,
                  title: "Sign up"),
              Spacer(),
              // 登录
              textFlatButton(
                  onPressed: _handlerSignIn,
                  width: 140,
                  height: 44,
                  marginTop: 20,
                  background: AppColors.primaryElement,
                  title: "Sign in"),
            ],
          ),
          // 忘记密码
          FlatButton(
            onPressed: () {},
            child: Text(
              "Forget password?",
              style: TextStyle(
                  fontSize: duSetFontSize(12), color: AppColors.primaryElement),
            ),
          )
        ],
      ),
    );
  }

  // 第三方登录
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

  /// 注册按钮
  Widget _buildSignUpButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20.0)),
      child: textFlatButton(
          onPressed: _handleNavSignup,
          width: duSetWidth(295.0),
          title: "Sign up",
          background: AppColors.secondaryElement,
          textColor: AppColors.primaryText),
    );
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {});
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            _buildLogo(),
            _buildInputForm(),
            _buildThirdPartyLogin(),
            Spacer(),
            _buildSignUpButton()
          ],
        ),
      ),
    );
  }
}
