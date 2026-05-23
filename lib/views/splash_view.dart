// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hello_world/views/login_view.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({super.key});

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   void authCofig() {
//     Future.delayed(Duration(seconds: 3), () {
//       Get.off(() => LoginView());
//     });
//   }

//   @override
//   void initState() {
//     authCofig();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Splash Screen",
//               style: Theme.of(context).textTheme.displayLarge,
//             ),
//             Text("This is the splash screen "),
//           ],
//         ),
//       ),
//     );
//   }
// }
