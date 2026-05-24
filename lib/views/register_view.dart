import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hello_world/controllers/auth_controller.dart';
import 'package:hello_world/utils/app_size.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final AuthController controller = Get.put(AuthController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppSize.screenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(100),

              Text(
                "Register",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  height: 1.3,
                  // letterSpacing: -0.02 * 32,
                ),
              ),

              Text("create an account to continue"),
              Gap(AppSize.vGap),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  label: Text("Full Name"),
                  hint: Text("Enter your Full Name"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Gap(AppSize.vGap),
              TextFormField(
                controller: emailController,
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
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your Password",
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

              Gap(AppSize.vGap * 2),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    controller.register(
                      nameController.text.trim(),
                      emailController.text.trim().toLowerCase(),
                      passwordController.text.trim(),
                    );
                  },
                  child: const Text("Register", style: TextStyle(fontSize: 16)),
                ),
              ),
              Gap(AppSize.vGap * 2),
              Row(
                children: [
                  Expanded(child: Divider()),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "or",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
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
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: "Don't have an account? "),

                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
