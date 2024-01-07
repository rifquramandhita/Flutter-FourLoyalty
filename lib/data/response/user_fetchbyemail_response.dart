import 'dart:convert';

import 'package:four_loyalty/data/model/user_model.dart';
import 'package:four_loyalty/data/response/base_response.dart';

class User_FetchByEmail_response extends Base_response {
  final User_model data;

  User_FetchByEmail_response(
      {required this.data, required super.success, required super.message});

  factory User_FetchByEmail_response.fromJson(Map<String, dynamic> json) {
    return User_FetchByEmail_response(
        data: User_model.fromJson(json['data']),
        success: json['success'],
        message: (json['message'] is Map)
            ? jsonEncode(json['message'])
            : json['message']);
  }
}
