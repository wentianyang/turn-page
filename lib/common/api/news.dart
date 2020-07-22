import 'package:turn_page/common/entity/categories.dart';
import 'package:turn_page/common/utils/http.dart';

/// 新闻
class NewsAPI {
  /// 分类
  static Future<List<CategoryResponseEntity>> categories() async {
    var response = await HttpUtil().get("/categories");
    return response
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromJson(item))
        .toList();
  }
}
