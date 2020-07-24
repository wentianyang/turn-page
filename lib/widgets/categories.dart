import 'package:flutter/cupertino.dart';
import 'package:turn_page/common/entity/entities.dart';
import 'package:turn_page/common/utils/utils.dart';
import 'package:turn_page/common/values/values.dart';

/// 分类控件
Widget categories({
  List<CategoryResponseEntity> categories,
  String selCategoryCode,
  Function(CategoryResponseEntity) onTap,
}) {
  return categories == null
      ? Container()
      : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories
                .map((e) => Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: duSetWidth(8.0)),
                      height: duSetHeight(52.0),
                      child: GestureDetector(
                        onTap: () => onTap(e),
                        child: Text(
                          e.title,
                          style: TextStyle(
                            color: e.code == selCategoryCode
                                ? AppColors.primaryElement
                                : AppColors.primaryText,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            fontSize: duSetFontSize(18.0),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        );
}
