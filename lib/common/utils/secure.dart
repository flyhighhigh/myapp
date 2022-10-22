import 'dart:convert';
import 'package:crypto/crypto.dart';

/// SHA256
String cryptoSHA(String input) {
  String salt = 'FF8iV6ffN!goZkqt#JxOEIpWsyfiy@R@X#qn17!StJNdZK1f'; // 加鹽
  var bytes = utf8.encode(input + salt);
  var digest = sha256.convert(bytes);

  return digest.toString();
}