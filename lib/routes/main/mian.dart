import 'package:flutter/material.dart';
import 'package:turn_page/common/api/api.dart';
import 'package:turn_page/common/entity/categories.dart';
import 'package:turn_page/common/entity/channels.dart';
import 'package:turn_page/common/entity/news.dart';
import 'package:turn_page/common/utils/screen.dart';
import 'package:turn_page/common/values/colors.dart';
import 'package:turn_page/widgets/categories.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 新闻翻页
  NewsPageListResponseEntity _newsPageList;
  // 新闻推荐
  NewsRecommendResponseEntity _newsRecommend;
  // 分类
  List<CategoryResponseEntity> _categories;
  // 频道
  List<ChannelResponseEntity> _channels;

  String _selCategoryCode = "";

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // 读取所有数据
  _loadData() async {
    _newsPageList = await NewsAPI.newsPageList();
    _newsRecommend = await NewsAPI.recommend();
    _categories = await NewsAPI.categories();
    _channels = await NewsAPI.channels();
    _selCategoryCode = _categories.first.code;
    if (mounted) {
      setState(() {});
    }
  }

  _handleCategoryOnTap(CategoryResponseEntity category) {
    setState(() {
      _selCategoryCode = category.code;
    });
  }

  // 分类
  Widget _buildCategories() {
    return categories(
        categories: _categories,
        selCategoryCode: _selCategoryCode,
        onTap: _handleCategoryOnTap);
  }

  // 推荐
  Widget _buildRecommend() {
    return Container(
      height: duSetHeight(490.0),
      color: Colors.deepPurple,
    );
  }

  // 频道
  Widget _buildChannels() {
    return Container(
      height: duSetHeight(137),
      color: Colors.blue,
    );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return Container(
      height: duSetHeight(161 * 5 + 100.0),
      color: Colors.lime,
    );
  }

  // 邮箱订阅
  Widget _buildEmailSubscribe() {
    return Container(
      height: duSetHeight(259.0),
      color: Colors.amber,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildCategories(),
        _buildRecommend(),
        _buildChannels(),
        _buildNewsList(),
        _buildEmailSubscribe(),
      ],
    );
  }
}
