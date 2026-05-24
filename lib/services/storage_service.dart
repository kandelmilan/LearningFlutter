import 'package:get_storage/get_storage.dart';

class StorageService {
  final _box = GetStorage();
  void saveToken(String token) {
    _box.write("token", token);
  }

  String? getToken() {
    return _box.read("token");
  }

  void clearToken() {
    _box.remove("token");
  }
}
