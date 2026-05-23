import 'package:dio/dio.dart';

class ProductService {
  static Future getProducts() async {
    var dio = Dio(
      BaseOptions(baseUrl: "https://ecommerce.codeitappsware.com/api/"),
    );
    var response = await dio.get("products");

    return response;
  }
}
