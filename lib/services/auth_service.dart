import 'package:hello_world/utils/api_connect.dart';

class AuthService {
  //register
  static Future register(String name, String email, String password) async {
    var response = await ApiConnect.dio.post(
      "register",
      data: {"name": name, "email": email, "password": password},
    );
    return response;
  }

  //login

  static Future login(String email, String password) async {
    var response = await ApiConnect.dio.post(
      "login",
      data: {"email": email, "password": password},
    );
    return response;
  }
}
