/// 检查邮箱格式
bool duIsEmail(String text) {
  if (stringNullOrEmpty(text)) return false;
  // 邮箱正则
  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexEmail).hasMatch(text);
}

/// 检查字符串长度
bool duCheckStringLength(String text, int length) {
  if (stringNullOrEmpty(text)) return false;
  return text.length >= length;
}

bool stringNullOrEmpty(String text) {
  if (text == null || text.isEmpty) return true;
  return false;
}
