import 'dart:convert';

import 'package:four_loyalty/data/response/base_response.dart';

class Auth_Login_response extends Base_response {
  final String? token;

  Auth_Login_response(
      {required super.success, required super.message, required this.token});

  factory Auth_Login_response.fromJson(Map<String, dynamic> json) {
    return Auth_Login_response(
        success: json['success'],
        message: (json['message'] is Map)
            ? jsonEncode(json['message'])
            : json['message'],
        token: json['token']);
  }
}
