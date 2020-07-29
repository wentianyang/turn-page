// 用户
import 'package:flutter/cupertino.dart';
import 'package:turn_page/common/entity/user.dart';
import 'package:turn_page/common/utils/http.dart';

class UserAPI {
  /// 登录
  static Future<UserLoginResponseEntity> login(
    BuildContext context, {
    UserLoginRequestEntity params,
  }) async {
    var response = await HttpUtil().post(
      '/user/login',
      params: params,
      context: context,
    );
    return UserLoginResponseEntity.fromJson(response);
  }
}
