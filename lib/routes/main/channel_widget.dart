import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turn_page/common/entity/entities.dart';
import 'package:turn_page/common/utils/screen.dart';
import 'package:turn_page/common/values/colors.dart';
import 'package:turn_page/common/values/shadows.dart';

/// 频道 Widget
Widget channelWidget(List<ChannelResponseEntity> channels,
    Function(ChannelResponseEntity) onTap) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: channels
          .map((item) => Container(
                width: duSetWidth(70.0),
                height: duSetHeight(100.0),
                margin: EdgeInsets.symmetric(horizontal: duSetWidth(10.0)),
                child: InkWell(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: duSetHeight(80.0),
                        margin: EdgeInsets.symmetric(horizontal: duSetWidth(3)),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            // 阴影
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: duSetHeight(70.0),
                                decoration: BoxDecoration(
                                    color: AppColors.primaryBackground,
                                    boxShadow: [Shadows.primaryShadow],
                                    borderRadius: BorderRadius.circular(35)),
                              ),
                            ),
                            // 图标
                            Positioned(
                                top: duSetHeight(12.0),
                                child: Image.asset(
                                  "assets/images/channel-${item.code}.png",
                                  fit: BoxFit.none,
                                )),
                          ],
                        ),
                      ),
                      // 标题
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.thirdElementText,
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.w400,
                          fontSize: duSetFontSize(14),
                          height: 1,
                        ),
                      )
                    ],
                  ),
                  onTap: () => onTap(item),
                ),
              ))
          .toList(),
    ),
  );
}
