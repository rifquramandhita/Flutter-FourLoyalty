class Coupon_model {
  final String id;
  final String title;
  final String description;
  final String imgPath;
  final String isClaimed;

  Coupon_model(
      {required this.id,
      required this.title,
      required this.description,
      required this.imgPath,
      required this.isClaimed});

  factory Coupon_model.fromJson(Map<String, dynamic> json) {
    return Coupon_model(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        imgPath: json['img_path'],
        isClaimed: json['is_claimed']);
  }
}
