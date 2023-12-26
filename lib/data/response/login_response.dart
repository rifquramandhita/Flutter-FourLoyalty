import 'package:four_loyalty/data/response/base_response.dart';

class LoginResponse extends BaseResponse {
  final String? token;

  LoginResponse(
      {required super.success, required super.message, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        success: json['success'],
        message: json['message'],
        token: json['token']);
  }
}
