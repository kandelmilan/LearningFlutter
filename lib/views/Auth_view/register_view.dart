import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hello_world/controllers/auth_controller.dart';
import 'package:hello_world/utils/app_size.dart';
import 'package:hello_world/views/Auth_view/login_view.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSize.screenPadding),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(150),

                  /// TITLE
                  Text(
                    "Register",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      height: 1.3,
                    ),
                  ),

                  const Text("Create an account to continue"),

                  Gap(AppSize.vGap * 2),

                  /// FULL NAME
                  TextFormField(
                    controller: controller.name,
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      hintText: "Enter your Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(width: 1.5),
                      ),
                    ),
                  ),

                  Gap(AppSize.vGap),

                  /// EMAIL
                  TextFormField(
                    controller: controller.email,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(width: 1.5),
                      ),
                    ),
                  ),

                  Gap(AppSize.vGap),

                  /// PASSWORD
                  Obx(() {
                    return TextFormField(
                      controller: controller.password,
                      obscureText: controller.obsecure.value,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.tooglePassword();
                          },
                          icon: controller.obsecure.value == true
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(width: 1.5),
                        ),
                      ),
                    );
                  }),

                  Gap(AppSize.vGap * 2),

                  /// REGISTER BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          Loader.show(context);
                          print("Register Button Clicked");
                          await controller.register();
                          print("Register Success");
                        } catch (e) {
                          print(e);

                          Get.snackbar(
                            "Error",
                            e.toString(),
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        } finally {
                          if (Loader.isShown) {
                            Loader.hide();
                          }
                        }
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  Gap(AppSize.vGap * 2),

                  /// DIVIDER
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "or",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),

                  Gap(AppSize.vGap * 2),

                  /// GOOGLE BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      icon: Image.asset("images/google.png", height: 22),
                      label: const Text("Continue with Google"),
                    ),
                  ),

                  Gap(AppSize.vGap),

                  /// APPLE BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.apple, size: 24),
                      label: const Text("Continue with Apple"),
                    ),
                  ),

                  Gap(100),

                  /// LOGIN TEXT
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: "Already have an account? "),
                          TextSpan(
                            text: "Login",

                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => const LoginView());
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
