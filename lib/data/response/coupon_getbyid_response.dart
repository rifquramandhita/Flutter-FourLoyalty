import 'package:four_loyalty/data/model/coupon_model.dart';
import 'package:four_loyalty/data/response/base_response.dart';

class Coupon_GetById_response extends Base_response {
  final List<Coupon_model> data;

  Coupon_GetById_response(
      {required this.data, required super.success, required super.message});

  factory Coupon_GetById_response.fromJson(Map<String, dynamic> json) {
    return Coupon_GetById_response(
        data: List<Coupon_model>.from(
            json['data'].map((item) => Coupon_model.fromJson(item))),
        success: json['success'],
        message: json['message']);
  }
}
