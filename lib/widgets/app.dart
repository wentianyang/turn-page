import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:turn_page/common/values/colors.dart';

Widget transparentAppbar(
    {@required BuildContext context,
    String title,
    Widget titleView,
    bool showBack = true,
    List<Widget> actions}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: titleView ?? Text(title),
    elevation: 0,
    leading: showBack
        ? IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        : null,
    actions: actions,
  );
}

/// 骨架屏
Widget cardListSkeleton() {
  return PKCardListSkeleton(
    isCircularImage: true,
    isBottomLinesActive: false,
    length: 10,
  );
}
