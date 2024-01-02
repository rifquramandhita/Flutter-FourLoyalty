import 'dart:ffi';

class UserCoupon_model {
  final String id;
  final String couponId;
  final String userEmail;
  final String title;
  final String description;
  final String? imagePath;
  final String expAt;

  UserCoupon_model(
      {required this.id,
      required this.couponId,
      required this.userEmail,
      required this.title,
      required this.description,
      required this.imagePath,
      required this.expAt});

  factory UserCoupon_model.fromJson(Map<String, dynamic> json) {
    return UserCoupon_model(
        id: json['id'],
        couponId: json['coupon_id'],
        userEmail: json['user_email'],
        title: json['title'],
        description: json['description'],
        imagePath: json['img_path'],
        expAt: json['exp_at']);
  }
}
