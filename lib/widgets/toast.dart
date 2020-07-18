import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:turn_page/common/utils/screen.dart';

Future<bool> toast(
    {@required String msg,
    Color textColor,
    Color backgroundColor = Colors.black}) async {
  return await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: duSetFontSize(16));
}
