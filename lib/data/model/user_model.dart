class User_model {
  final String email;
  final String name;
  final String address;
  final String phone;
  final String point;

  User_model(
      {required this.email,
      required this.name,
      required this.address,
      required this.phone,
      required this.point});

  factory User_model.fromJson(Map<String, dynamic> json) {
    return User_model(
        email: json['email'],
        name: json['name'],
        address: json['address'],
        phone: json['phone'],
        point: json['point']);
  }
}
