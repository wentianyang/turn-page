import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turn_page/common/values/colors.dart';

Widget transparentAppbar(
    {@required BuildContext context, List<Widget> actions}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(''),
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.primaryText,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: actions,
  );
}
