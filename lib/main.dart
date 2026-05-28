import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hello_world/bindings/controller_binding.dart';
import 'package:hello_world/views/Auth_view/login_view.dart';
import 'package:hello_world/views/onboading/splash_view.dart';
import 'package:requests_inspector/requests_inspector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(RequestsInspector(enabled: true, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: LoginView(),
      initialBinding: ControllerBinding(),
    );
  }
}
