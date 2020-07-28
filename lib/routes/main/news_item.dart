import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:turn_page/common/entity/entities.dart';
import 'package:turn_page/common/utils/screen.dart';
import 'package:turn_page/common/utils/utils.dart';
import 'package:turn_page/common/values/colors.dart';
import 'package:turn_page/widgets/image.dart' as image;

/// 新闻列表
Widget newsItem(NewsItem item) {
  return Container(
    height: duSetHeight(162),
    padding: EdgeInsets.symmetric(vertical: duSetHeight(20)),
    child: InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 图片
          image.imageCache(
            item.thumbnail,
            width: duSetWidth(122),
            height: duSetHeight(122),
          ),
          //
          SizedBox(
            width: duSetWidth(194),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 作者
                Container(
                  child: Text(
                    item.author,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.thirdElementText,
                      fontSize: duSetFontSize(14),
                      fontFamily: "",
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                    maxLines: 1,
                  ),
                ),
                // 标题
                Container(
                  margin: EdgeInsets.only(top: duSetHeight(10.0)),
                  padding: EdgeInsets.only(bottom: duSetHeight(2.0)),
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: duSetFontSize(16.0),
                      color: AppColors.primaryText,
                      fontFamily: "",
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                // 底部
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // 分类
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: duSetWidth(60.0),
                      ),
                      child: Container(
                        child: Text(
                          item.category,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: duSetFontSize(14.0),
                              fontWeight: FontWeight.normal,
                              fontFamily: "Avenir",
                              color: AppColors.secondaryElementText),
                        ),
                      ),
                    ),
                    // 日期
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: duSetWidth(100.0),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: duSetHeight(5)),
                        child: Text(
                          "· ${duTimeLineFormat(item.addtime)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: duSetFontSize(12.0),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Avenir",
                            height: 1,
                            color: AppColors.thirdElementText,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                    Spacer(),
                    // 更多按钮
                    InkWell(
                      child: Icon(
                        Icons.more_horiz,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
