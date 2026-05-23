import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/bindings/controller_binding.dart';
import 'package:hello_world/controllers/auth_controller.dart';
import 'package:hello_world/views/product_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: ProductView(),
      initialBinding: ControllerBinding(),
    );
  }
}
