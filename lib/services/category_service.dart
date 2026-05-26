import 'package:hello_world/utils/api_connect.dart';

class CategoryService {
  static Future getCategories() async {
    var dio = ApiConnect.dio;
    var response = await dio.get("categories");
    return response;
  }
}

class ProductByCategoryService {
  static Future getProductByCategory(int id) async {
    var dio = ApiConnect.dio;
    var response = await dio.get("category/$id");
    return response;
  }
}
