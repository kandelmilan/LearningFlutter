import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  void login(String email, String password) async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    if (email == "admin@gmail.com" && password == "123456") {
      Get.snackbar("Success", "Login successful");
    } else {
      Get.snackbar("Error", "Invalid email or password");
    }

    isLoading.value = false;
  }
}
