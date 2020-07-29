import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turn_page/common/provider/app.dart';
import 'package:turn_page/common/utils/authentication.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Column(
      children: <Widget>[
        Text('Account'),
        MaterialButton(
          onPressed: () {
            appState.switchGrayFilter();
          },
          child: Text("灰色切换"),
        ),
        MaterialButton(
          onPressed: () {
            goLoginPage(context);
          },
          child: Text("推出登录"),
        )
      ],
    );
  }
}
