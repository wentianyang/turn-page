
import 'package:flutter_screenutil/screenutil.dart';

// 设置宽度
double duSetWidth(double width){
  return ScreenUtil().setWidth(width);
}

// 设置高度
double duSetHeight(double height){
  return ScreenUtil().setHeight(height);
}

// 设置字体尺寸
double duSetFontSize(double size){
  return ScreenUtil().setSp(size);
}