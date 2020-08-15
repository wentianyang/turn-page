import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turn_page/common/entity/entities.dart';
import 'package:turn_page/common/route/route.gr.dart';
import 'package:turn_page/common/utils/screen.dart';
import 'package:turn_page/common/utils/utils.dart';
import 'package:turn_page/common/values/colors.dart';
import 'package:turn_page/widgets/image.dart' as image;

/// 新闻推荐
Widget recommendWidget(NewsRecommendResponseEntity newsRecommend) {
  return Container(
    margin: EdgeInsets.all(
      duSetWidth(20),
    ),
    child: Column(
      children: <Widget>[
        // 图
        InkWell(
          onTap: () {
            ExtendedNavigator.root.push(
              Routes.detailPage,
              arguments: DetailPageArguments(
                title: newsRecommend.title,
                url: newsRecommend.url,
              ),
            );
          },
          child: image.imageCache(
            newsRecommend.thumbnail,
            width: duSetWidth(335),
            height: duSetHeight(290),
          ),
        ),
        // 作者
        Container(
          margin: EdgeInsets.only(
            top: duSetHeight(14),
          ),
          child: Text(
            newsRecommend.author,
            style: TextStyle(
              fontFamily: "Avenir",
              fontSize: duSetFontSize(14),
              fontWeight: FontWeight.normal,
              color: AppColors.thirdElementText,
            ),
          ),
        ),
        // 标题
        Container(
          margin: EdgeInsets.only(
            top: duSetHeight(10),
          ),
          child: Text(
            newsRecommend.title,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              fontSize: duSetFontSize(20),
              color: AppColors.primaryText,
              height: 1,
            ),
          ),
        ),
        // 一行三列
        Container(
          margin: EdgeInsets.only(
            top: duSetHeight(30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // 分类
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120.0,
                ),
                child: Text(
                  newsRecommend.category,
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    color: AppColors.secondaryElementText,
                    fontSize: duSetFontSize(14),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              // 时间
              Container(
                width: duSetWidth(15),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120.0,
                ),
                child: Text(
                  '。${duTimeLineFormat(newsRecommend.addtime)}',
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    color: AppColors.thirdElementText,
                    fontSize: duSetFontSize(14),
                    height: 1,
                  ),
                ),
              ),
              Spacer(),
              // 更多
              InkWell(
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.primaryText,
                  size: 24,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
