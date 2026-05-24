import 'package:get/get.dart';
import 'package:hello_world/services/auth_service.dart';
import 'package:hello_world/services/storage_service.dart';
import 'package:hello_world/views/login_view.dart';
import 'package:hello_world/views/product_view.dart';

class AuthController extends GetxController {
  final StorageService storage = StorageService();
  final AuthService _authService = AuthService();

  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      final response = await _authService.login(email, password);

      final data = response.data;

      print("LOGIN RESPONSE: $data");

      if (data["success"] == false) {
        Get.snackbar("Login Failed", data["message"]);
        return;
      }

      // SAVE TOKEN HERE
      // final token = data["token"];
      // storage.saveToken(token);

      // print("TOKEN SAVED: $token");

      Get.snackbar("Success", "Login successful");

      Get.offAll(() => ProductView());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(String name, String email, String password) async {
    try {
      isLoading.value = true;

      final res = await _authService.register(name, email, password);

      print(res.data);

      Get.snackbar("Success", "Register successful");
      Get.offAll(() => LoginView());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
