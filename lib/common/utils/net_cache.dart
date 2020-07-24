import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:turn_page/common/values/cache.dart';

class CacheObject {
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;
  Response response;
  int timeStamp;

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}

class NetCache extends Interceptor {
  // 为了确保迭代器顺序和对象插入时间顺序一致，使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  Future onRequest(RequestOptions options) async {
    if (!CACHE_ENABLE) return options;

    // 是否是下拉刷新
    bool refresh = options.extra["refresh"] == true;
    if (refresh) {
      // 若是下拉刷新，先删除相关缓存
      if (options.extra["list"] == true) {
        // 若是列表，则只要url中包含当前path的缓存全部删除（并不精确）
        cache.removeWhere((key, value) => key.contains(options.path));
      } else {
        // 如果不是列表，则指删除uri相同的缓存
        delete(options.uri.toString());
      }
      return options;
    }

    // get 请求，开启缓存
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == 'get') {
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var ob = cache[key];
      if (ob != null) {
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 <
            // 若缓存未过期，则返回缓存内容
            CHACHE_MAXAGE) {
          return cache[key].response;
        } else {
          // 缓存已过期，删除缓存，向服务器请求
          cache.remove(key);
        }
      }
    }
  }

  @override
  Future onResponse(Response response) async {
    // 如果启用缓存，将返回结果保存到缓存
    if (CACHE_ENABLE) {
      _saveCache(response);
    }
  }

  @override
  Future onError(DioError err) async {
    // 错误状态不缓存
  }

  void delete(String key) {
    cache.remove(key);
  }

  _saveCache(Response response) {
    RequestOptions options = response.request;
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      if (CACHE_MAXCOUNT == cache.length) {
        // 如果缓存数量超过最大缓存数量限制，则先移除最早的一条记录
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = CacheObject(response);
    }
  }
}
