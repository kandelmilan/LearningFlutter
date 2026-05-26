import 'package:hello_world/utils/api_connect.dart';

class ProductService {
  static Future getProducts() async {
    var dio = ApiConnect.dio;
    var response = await dio.get("products");

    return response;
  }

  //Featurd Product
  static Future getFeaturedProducts() async {
    var dio = ApiConnect.dio;
    var response = await dio.get("featured-products");
    return response;
  }
}
