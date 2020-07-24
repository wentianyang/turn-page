import 'package:turn_page/common/entity/categories.dart';
import 'package:turn_page/common/entity/entities.dart';
import 'package:turn_page/common/utils/http.dart';

/// 新闻
class NewsAPI {
  /// 翻页
  static Future<NewsPageListResponseEntity> newsPageList(
      {NewsPageListRequestEntity params}) async {
    var response = await HttpUtil().get("/news", params: params);
    return NewsPageListResponseEntity.fromJson(response);
  }

  /// 分类
  static Future<List<CategoryResponseEntity>> categories() async {
    var response = await HttpUtil().get("/categories");
    return response
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromJson(item))
        .toList();
  }

  /// 频道
  static Future<List<ChannelResponseEntity>> channels() async {
    var response = await HttpUtil().get("/channels");
    return response
        .map<ChannelResponseEntity>((e) => ChannelResponseEntity.fromJson(e))
        .toList();
  }

  /// 推荐新闻
  static Future<NewsRecommendResponseEntity> recommend() async {
    var response = await HttpUtil().get("/news/recommend");
    return NewsRecommendResponseEntity.fromJson(response);
  }
}
