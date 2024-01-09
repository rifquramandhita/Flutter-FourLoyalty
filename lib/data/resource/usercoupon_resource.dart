import 'dart:convert';

import 'package:four_loyalty/data/preference/share_preference.dart';
import 'package:four_loyalty/data/response/base_response.dart';
import 'package:four_loyalty/data/response/usercoupon_getbyuser_response.dart';
import 'package:http/http.dart';

import '../../const.dart';

class UserCoupon_resource {
  static final String URL = Const.BASE_URL + "api/usercoupon/";

  static Future<UserCoupon_GetByUser_response> getByUser() async {
    final token = await SharePreference.getString(Const.PREF_USER_TOKEN);
    final response = await get(Uri.parse(URL + 'getByUser'), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    final body = jsonDecode(response.body);
    return UserCoupon_GetByUser_response.fromJson(body);
  }

  static Future<Base_response> claim(couponId) async {
    final token = await SharePreference.getString(Const.PREF_USER_TOKEN);
    final response = await post(Uri.parse(URL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({'coupon_id': couponId}));
    final body = jsonDecode(response.body);
    return Base_response.fromJson(body);
  }
}
