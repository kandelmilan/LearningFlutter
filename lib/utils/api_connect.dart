import 'package:dio/dio.dart';
import 'package:hello_world/services/storage_service.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'package:requests_inspector/requests_inspector.dart';

class ApiConnect {
  static Dio dio =
      Dio(
          BaseOptions(
            baseUrl: "https://ecommerce.codeitappsware.com/api/",
            headers: {"Accept": "application/json"},
          ),
        )
        ..interceptors.addAll([
          RequestsInspectorInterceptor(),

          // InterceptorsWrapper(
          //   onRequest: (options, handler) {
          //     String? token = StorageService.getToken();

          //     if (token != null) {
          //       options.headers["Authorization"] = "Bearer $token";
          //     }

          //     return handler.next(options);
          //   },
          // ),
        ]);
}
