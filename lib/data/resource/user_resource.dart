import 'dart:convert';

import 'package:four_loyalty/const.dart';
import 'package:four_loyalty/data/preference/share_preference.dart';
import 'package:four_loyalty/data/response/user_fetchbyemail_response.dart';
import 'package:http/http.dart';

class User_resource {
  static final String URL = Const.BASE_URL + "api/users/";

  static Future<User_FetchByEmail_response> fetchMe() async {
    final token = await SharePreference.getString(Const.PREF_USER_TOKEN);
    final response = await get(Uri.parse(URL + 'me'),
        headers: {"Content-Type": "application/json",
        "Authorization" : "Bearer $token"});
    final body = jsonDecode(response.body);
    return User_FetchByEmail_response.fromJson(body);
  }
}
