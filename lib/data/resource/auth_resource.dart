import 'dart:convert';

import 'package:four_loyalty/const.dart';
import 'package:four_loyalty/data/response/login_response.dart';
import 'package:http/http.dart';

class Auth_resource {
  static Future<Auth_Login_response> login(String email, String password) async {
    final response = await post(Uri.parse(Const.BASE_URL + 'api/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email, 'password': password}));
    final body = jsonDecode(response.body);
    return Auth_Login_response.fromJson(body);
  }
}
