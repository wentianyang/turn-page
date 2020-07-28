import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turn_page/common/utils/screen.dart';
import 'package:turn_page/common/values/radii.dart';

/// 带有缓存功能的ImageWiget
Widget imageCache(
  String url, {
  double width = 48,
  double height = 48,
  EdgeInsetsGeometry margin,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      width: duSetWidth(width),
      height: duSetHeight(height),
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: Radii.k6pxRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          )),
    ),
    placeholder: (context, url) {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    },
    errorWidget: (context, url, error) => Icon(
      Icons.broken_image,
    ),
  );
}
