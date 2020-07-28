import 'package:intl/intl.dart';

/// 格式化时间
String duTimeLineFormat(DateTime dt) {
  var now = DateTime.now();
  var difference = now.difference(dt);

  if (difference.inHours < 24) {
    // 1天内
    return "${difference.inHours} hours ago";
  } else if (difference.inDays < 30) {
    // 30 天内
    return "${difference.inDays} days ago";
  } else if (difference.inDays < 365) {
    //
    final dtFormat = new DateFormat('MM-dd');
    return dtFormat.format(dt);
  } else {
    final dtFormat = new DateFormat("yyyy-MM-dd");
    return dtFormat.format(dt);
  }
}
