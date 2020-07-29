import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:turn_page/common/utils/net_cache.dart';
import 'package:turn_page/common/values/cache.dart';
import 'package:turn_page/common/values/values.dart';
import 'package:turn_page/global.dart';
import 'package:turn_page/widgets/toast.dart';

import 'utils.dart';

class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() => _instance;

  Dio dio;
  CancelToken cancelToken = new CancelToken();

  HttpUtil._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级一次递增，且可以根据优先级覆盖参数
    BaseOptions options = new BaseOptions(
        baseUrl: SERVER_API_URL,
        // 连接服务器事件，单位是毫秒
        connectTimeout: 10 * 1000,
        // 相应流上前后两次接受数据的间隔，单位毫秒
        receiveTimeout: 5 * 1000,
        // 请求头
        headers: {},
        contentType: 'applicetion/json; charset=utf-8',
        // 响应数据格式
        responseType: ResponseType.json);

    dio = new Dio(options);

    // Cookie管理
    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    // 添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options;
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError e) {
      ErrorEntity eInfo = createErrorEntity(e);
      // 错误提示
      toast(msg: eInfo.message);
      var context = e.request.extra["context"];
      if (context != null) {
        switch (eInfo.code) {
          case 401:
            // 没有权限 重新登录
            goLoginPage(context);
            break;
          default:
        }
      }
      return eInfo;
    }));
    // 添加缓存拦截器
    dio.interceptors.add(NetCache());

    // 使用代理在调试模式下抓包（禁用https证书校验）
    if (!Global.isRelease && PROXY_ENABLE) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return "PROXY $PROXY_IP:$PROXY_PORT";
        };
        // 代理工具会提供一个抓包的自签名证书，会通不过校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  // error 统一处理
  ErrorEntity createErrorEntity(DioError e) {
    switch (e.type) {
      case DioErrorType.CANCEL:
        return ErrorEntity(code: -1, message: "请求取消");
      case DioErrorType.CONNECT_TIMEOUT:
        return ErrorEntity(code: -1, message: "连接超时");
      case DioErrorType.SEND_TIMEOUT:
        return ErrorEntity(code: -1, message: "请求超时");
      case DioErrorType.RECEIVE_TIMEOUT:
        return ErrorEntity(code: -1, message: "响应超时");
      case DioErrorType.RESPONSE:
        try {
          int errCode = e.response.statusCode;
          switch (errCode) {
            case 400:
              return ErrorEntity(code: errCode, message: "请求语法错误");
            case 401:
              return ErrorEntity(code: errCode, message: "没有权限");
            case 403:
              return ErrorEntity(code: errCode, message: "服务器拒绝请求");
            case 404:
              return ErrorEntity(code: errCode, message: "无法连接到服务器");
            case 405:
              return ErrorEntity(code: errCode, message: "请求方法被禁止");
            case 500:
              return ErrorEntity(code: errCode, message: "服务器内部错误");
            case 502:
              return ErrorEntity(code: errCode, message: "无效的请求");
            case 503:
              return ErrorEntity(code: errCode, message: "服务器挂了");
            case 505:
              return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
            default:
              return ErrorEntity(
                  code: errCode, message: e.response.statusMessage);
          }
        } on Exception catch (_) {
          return ErrorEntity(code: -1, message: "未知错误");
        }
        break;
      default:
        return ErrorEntity(code: -1, message: e.message);
    }
  }

  // 取消请求
  void cancelRequest(CancelToken token) {
    token.cancel("cancelled");
  }

  /// restful get 操作
  Future get(String path,
      {@required BuildContext context,
      dynamic params,
      Options options,
      bool refresh = false,
      bool noCache = !CACHE_ENABLE,
      bool list = false,
      String cacheKey}) async {
    try {
      var requestOptions = options ?? Options();
      requestOptions = requestOptions.merge(extra: {
        "context": context,
        "refresh": refresh,
        "noCache": noCache,
        "list": list,
        "cacheKey": cacheKey
      });

      Map<String, dynamic> _authorization = getAuthorizationHeader();
      if (_authorization != null) {
        requestOptions = requestOptions.merge(headers: _authorization);
      }
      var response = await dio.get(path,
          queryParameters: params,
          options: requestOptions,
          cancelToken: cancelToken);
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful post 操作
  Future post(
    String path, {
    @required BuildContext context,
    dynamic params,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      Options requestOptions = options ?? Options();
      requestOptions.merge(extra: {
        "context": context,
      });

      Map<String, dynamic> _authorization = getAuthorizationHeader();
      if (_authorization != null) {
        requestOptions = requestOptions.merge(headers: _authorization);
      }
      var response = await dio.post(path,
          data: params, options: requestOptions, cancelToken: cancelToken);
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful put 操作
  Future put(String path,
      {dynamic params, Options options, CancelToken cancelToken}) async {
    try {
      var tokenOptions = options ?? getAuthorizationHeader();
      var response = await dio.put(path,
          data: params, options: tokenOptions, cancelToken: cancelToken);
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful delete 操作
  Future delete(String path,
      {dynamic params, Options options, CancelToken cancelToken}) async {
    try {
      var tokenOptions = options ?? getAuthorizationHeader();
      var response = await dio.delete(path,
          data: params, options: tokenOptions, cancelToken: cancelToken);
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful post form 表单提交操作
  Future postForm(String path,
      {dynamic params, Options options, CancelToken cancelToken}) async {
    try {
      var tokenOptions = options ?? getAuthorizationHeader();
      var response =
          await dio.post(path, options: tokenOptions, cancelToken: cancelToken);
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  Map<String, dynamic> getAuthorizationHeader() {
    var headers;
    String accessToken = Global.profile?.accessToken;
    if (accessToken != null) {
      headers = {'Authorization': 'Bearer $accessToken'};
    }
    return headers;
  }
}

class ErrorEntity implements Exception {
  int code;
  String message;
  ErrorEntity({this.code, this.message});

  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}
