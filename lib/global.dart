import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turn_page/common/utils/http.dart';
import 'package:turn_page/common/utils/storage.dart';
import 'package:turn_page/common/values/storage.dart';

import 'common/entity/entities.dart';

/// 全局管理
class Global {
  /// 用户配置
  static UserLoginResponseEntity profile = UserLoginResponseEntity(
    accessToken: null,
  );

  /// 是否是 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// 是否是第一次打开
  static bool isFirstOpen = false;

  /// 是否对·离线登录
  static bool isOfflineLogin = false;

  /// 初始化
  static Future init() async {
    // 运行初始化
    WidgetsFlutterBinding.ensureInitialized();

    // 本地化工具初始化
    await StorageUtil.init();

    // Http初始化
    HttpUtil();

    // 设备第一次打开
    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    // 读取用户信息
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = UserLoginResponseEntity.fromJson(_profileJSON);
      isOfflineLogin = true;
    }

    // android 状态栏为透明
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  /// 持久化用户信息
  static Future<bool> saveProfile(UserLoginResponseEntity userProfile) {
    profile = userProfile;
    isOfflineLogin = true;
    return StorageUtil()
        .setJSON(STORAGE_USER_PROFILE_KEY, userProfile.toJson());
  }
}
