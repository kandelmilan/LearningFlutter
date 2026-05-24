class LoginModel {
  LoginModel({required this.email, required this.password});

  final String? email;
  final String? password;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(email: json["email"], password: json["password"]);
  }
}
