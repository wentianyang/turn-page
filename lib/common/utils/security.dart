import 'dart:convert';

import 'package:crypto/crypto.dart';

String duSHA256(String text) {
  // 加盐
  String salt = "%jahsdj8(@kklashdlkijasd10289";
  var bytes = utf8.encode(text + salt);
  var digest = sha256.convert(bytes);
  return digest.toString();
}
