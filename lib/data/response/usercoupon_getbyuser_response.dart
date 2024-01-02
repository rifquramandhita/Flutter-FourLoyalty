import 'package:four_loyalty/data/model/usercoupon_model.dart';
import 'package:four_loyalty/data/response/base_response.dart';

class UserCoupon_GetByUser_response extends BaseResponse {
  final List<UserCoupon_model>? data;

  UserCoupon_GetByUser_response(
      {required this.data, required super.success, required super.message});

  factory UserCoupon_GetByUser_response.fromJson(Map<String, dynamic> json) {
    return UserCoupon_GetByUser_response(
        data: List<UserCoupon_model>.from(
            json['data'].map((item) => UserCoupon_model.fromJson(item))),
        success: json['success'],
        message: json['message']);
  }
}
