import 'dart:convert';

import 'package:four_loyalty/data/model/user_model.dart';
import 'package:four_loyalty/data/response/base_response.dart';

class User_FetchMyPoint_response extends Base_response {
  final String data;

  User_FetchMyPoint_response(
      {required this.data, required super.success, required super.message});

  factory User_FetchMyPoint_response.fromJson(Map<String, dynamic> json) {
    return User_FetchMyPoint_response(
        data: json['data'],
        success: json['success'],
        message: (json['message'] is Map)
            ? jsonEncode(json['message'])
            : json['message']);
  }
}
