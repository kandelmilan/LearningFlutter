import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/models/login_model.dart';
import 'package:hello_world/models/register_model.dart';
import 'package:hello_world/services/auth_service.dart';
import 'package:hello_world/services/storage_service.dart';
import 'package:hello_world/views/Auth_view/login_view.dart';
import 'package:hello_world/views/product_view/product_view.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var obsecure = true.obs;

  void tooglePassword() {
    obsecure.value = !obsecure.value;
  }

  var registerUser = RegisterModel(
    success: false,
    token: null,
    message: null,
  ).obs;
  var loginUser = LoginModel(success: false, token: null, message: null).obs;

  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  //register controller
  Future register() async {
    try {
      isLoading(true);

      print("REGISTER STARTED");

      var response = await AuthService.register(
        name.text.trim(),
        email.text.trim(),
        password.text.trim(),
      );

      print("RESPONSE RECEIVED: ${response?.data}");

      if (response != null) {
        registerUser.value = RegisterModel.fromJson(response.data);

        print("SUCCESS VALUE: ${registerUser.value.success}");

        if (registerUser.value.success == true) {
          Get.snackbar(
            "Success",
            registerUser.value.message ?? "Registration Successful",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 2),
          );
          Get.offAll(() => LoginView());
        } else {
          Get.snackbar(
            "Error",
            registerUser.value.message ?? "Registration Failed",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } catch (e, stack) {
      print("ERROR: $e");
      print(stack);

      Get.snackbar(
        "Exception",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  //login controller
  Future login() async {
    try {
      isLoading(true);

      print("LOGIN STARTED");

      var response = await AuthService.login(
        email.text.trim(),
        password.text.trim(),
      );

      print("RESPONSE RECEIVED: ${response?.data}");

      if (response != null) {
        loginUser.value = LoginModel.fromJson(response.data);

        print("SUCCESS VALUE: ${registerUser.value.success}");

        if (loginUser.value.success == true) {
          String? token = loginUser.value.token;

          if (token != null) {
            StorageService.saveToken(token);
            print("TOKEN SAVED : ${token}");
          }
          Get.snackbar(
            "Success",
            loginUser.value.message ?? "Registration Successful",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 2),
          );
          Get.offAll(() => ProductView());
        } else {
          Get.snackbar(
            "Error",
            loginUser.value.message ?? "Registration Failed",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } catch (e, stack) {
      print("ERROR: $e");
      print(stack);

      Get.snackbar(
        "Exception",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  //for splash screen 3 sec
  void checkAuth() {
    Future.delayed(const Duration(seconds: 3), () {
      // String? token = StorageService.getToken();

      // if (token != null) {
      //   Get.offAll(() => ProductView());
      // } else {
      //   Get.offAll(() => LoginView());
      // }
    });
  }

  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }
}
