import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://ecommerce.codeitappsware.com/api/"),
  );

  Future<Response> login(String email, String password) async {
    return await _dio.post(
      "login",
      data: {"email": email, "password": password},
    );
  }

  Future<Response> register(String name, String email, String password) async {
    return await _dio.post(
      "register",
      data: {"name": name, "email": email, "password": password},
    );
  }
}
