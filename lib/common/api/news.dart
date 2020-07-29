import 'package:flutter/cupertino.dart';
import 'package:turn_page/common/entity/categories.dart';
import 'package:turn_page/common/entity/entities.dart';
import 'package:turn_page/common/utils/http.dart';
import 'package:turn_page/common/values/storage.dart';

/// 新闻
class NewsAPI {
  /// 翻页
  static Future<NewsPageListResponseEntity> newsPageList(BuildContext context,
      {NewsPageListRequestEntity params}) async {
    var response = await HttpUtil().get(
      "/news",
      params: params,
      context: context,
      cacheKey: STORAGE_INDEX_NEWS_CACHE_KEY,
      cacheDisk: true,
    );
    return NewsPageListResponseEntity.fromJson(response);
  }

  /// 分类
  static Future<List<CategoryResponseEntity>> categories(
      BuildContext context) async {
    var response = await HttpUtil().get(
      "/categories",
      context: context,
      cacheDisk: true,
    );
    return response
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromJson(item))
        .toList();
  }

  /// 频道
  static Future<List<ChannelResponseEntity>> channels(
      BuildContext context) async {
    var response = await HttpUtil().get(
      "/channels",
      context: context,
      cacheDisk: true,
    );
    return response
        .map<ChannelResponseEntity>((e) => ChannelResponseEntity.fromJson(e))
        .toList();
  }

  /// 推荐新闻
  static Future<NewsRecommendResponseEntity> recommend(
      BuildContext context) async {
    var response = await HttpUtil().get(
      "/news/recommend",
      context: context,
      cacheDisk: true,
    );
    return NewsRecommendResponseEntity.fromJson(response);
  }
}
