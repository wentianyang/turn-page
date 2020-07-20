// 用户
import 'package:turn_page/common/entity/user.dart';
import 'package:turn_page/common/utils/http.dart';

class UserApi {
  /// 登录
  static Future<UserResponseEntity> login({UserRequestEntity params}) async {
    var response = await HttpUtil().post('/user/login', params: params);
    return UserResponseEntity.fromJson(response);
  }
}
