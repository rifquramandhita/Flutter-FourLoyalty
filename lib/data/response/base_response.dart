class Base_response {
  final bool success;
  final String message;

  Base_response({required this.success, required this.message});

  factory Base_response.fromJson(Map<String, dynamic> json) {
    return Base_response(success: json['success'], message: json['message']);
  }
}
