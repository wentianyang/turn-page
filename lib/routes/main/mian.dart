import 'dart:async';

import 'package:flutter/material.dart';
import 'package:turn_page/common/api/api.dart';
import 'package:turn_page/common/entity/categories.dart';
import 'package:turn_page/common/entity/channels.dart';
import 'package:turn_page/common/entity/news.dart';
import 'package:turn_page/common/utils/screen.dart';
import 'package:turn_page/common/utils/storage.dart';
import 'package:turn_page/common/values/values.dart';
import 'package:turn_page/routes/main/ad_widget.dart';
import 'package:turn_page/routes/main/channel_widget.dart';
import 'package:turn_page/routes/main/news_item.dart';
import 'package:turn_page/routes/main/newsletter_widget.dart';
import 'package:turn_page/routes/main/recommend_widget.dart';
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
    _loadLatesWithDiskCache();
  }

  // 读取所有数据
  _loadData() async {
    _newsPageList = await NewsAPI.newsPageList(context);
    _newsRecommend = await NewsAPI.recommend(context);
    _categories = await NewsAPI.categories(context);
    _channels = await NewsAPI.channels(context);
    _selCategoryCode = _categories.first.code;
    if (mounted) {
      setState(() {});
    }
  }

  // 读取磁盘缓存
  _loadLatesWithDiskCache() {
    if (CACHE_ENABLE) {
      var cacheData = StorageUtil().getJSON(STORAGE_INDEX_NEWS_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 3), () {});
      }
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
    return _newsRecommend == null
        ? Container()
        : recommendWidget(_newsRecommend);
  }

  // 频道
  Widget _buildChannels() {
    return Container(
      height: duSetHeight(137),
      child: _channels == null
          ? Container()
          : channelWidget(_channels, (ChannelResponseEntity channel) {}),
    );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(
            height: duSetHeight(161 * 5 + 100.0),
          )
        : Column(
            children: _newsPageList.items.map((item) {
              // 新闻
              List<Widget> newsWidgets = <Widget>[
                newsItem(item),
                Divider(
                  height: 1,
                )
              ];

              // 每5条显示1条广告
              int index = _newsPageList.items.indexOf(item);
              if ((index + 1) % 5 == 0) {
                newsWidgets.addAll(<Widget>[
                  adWidget(),
                  Divider(
                    height: 1,
                  )
                ]);
              }
              return Column(
                children: newsWidgets,
              );
            }).toList(),
          );
  }

  // 邮箱订阅
  Widget _buildEmailSubscribe() {
    return newSletterWidget();
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
