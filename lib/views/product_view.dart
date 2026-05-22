import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio(BaseOptions(baseUrl: "https://api.escuelajs.co/api/v1/"));
  Future getProducts() async {
    var response = await dio.get(" products");
    print(response.data);
  }
}
