import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hello_world/views/home_view.dart';
import 'package:hello_world/views/login_view.dart';
import 'package:hello_world/views/register_view.dart';
import 'package:hello_world/views/splash_view.dart';

void main() {
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
