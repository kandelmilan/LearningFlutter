import 'package:flutter/material.dart';
import 'package:hello_world/utils/app_string.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppString.splashImage, fit: BoxFit.cover),
      ),
    );
  }
}
