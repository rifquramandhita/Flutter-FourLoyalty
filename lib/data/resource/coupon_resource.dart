import 'dart:convert';

import 'package:four_loyalty/const.dart';
import 'package:four_loyalty/data/preference/share_preference.dart';
import 'package:four_loyalty/data/response/coupon_fetchall_response.dart';
import 'package:four_loyalty/data/response/coupon_getbyid_response.dart';
import 'package:http/http.dart';

class Coupon_resource {
  static final String URL = Const.BASE_URL + 'api/coupons/';

  static Future<Coupon_FetchAll_response> fetchAll() async {
    final token = await SharePreference.getString(Const.PREF_USER_TOKEN);
    final response = await get(Uri.parse(URL),
        headers: {"Content-Type": "application/json",
          "Authorization" : "Bearer $token"});
    final body = jsonDecode(response.body);
    return Coupon_FetchAll_response.fromJson(body);
  }

  static Future<Coupon_GetById_response> getById(String couponId) async {
    final token = await SharePreference.getString(Const.PREF_USER_TOKEN);
    final response = await get(Uri.parse(URL + couponId), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    final body = jsonDecode(response.body);
    return Coupon_GetById_response.fromJson(body);
  }

}
