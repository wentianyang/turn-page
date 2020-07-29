import 'package:flutter/material.dart';
import 'package:turn_page/common/utils/storage.dart';
import 'package:turn_page/common/values/storage.dart';
import 'package:turn_page/global.dart';

/// 检查Token
Future<bool> isAuthenticated() async {
  var profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJSON != null;
}

/// 删除缓存Token
Future deleteAuthentication() async {
  await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
  Global.profile = null;
}

/// 重新登录
Future goLoginPage(BuildContext context) async {
  await deleteAuthentication();
  Navigator.pushNamedAndRemoveUntil(
    context,
    "/sign-in",
    (Route<dynamic> route) => false,
  );
}
