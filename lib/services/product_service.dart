import 'package:dio/dio.dart';
import 'package:hello_world/utils/api_connect.dart';

class ProductService {
  static Future getProducts() async {
    // var dio = Dio(
    //   BaseOptions(baseUrl: "https://ecommerce.codeitappsware.com/api/"),
    // );\
    var dio = ApiConnect.dio;
    var response = await dio.get("products");

    return response;
  }
}
