import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/controllers/auth_controller.dart';
import 'package:hello_world/views/home/screen/components/home_view.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: 'Flutter Demo', home: HomeView());
  }
}
