import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hello_world/controllers/auth_controller.dart';
import 'package:hello_world/utils/app_size.dart';
import 'package:hello_world/views/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthController controller = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSize.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset("images/logo.png", height: 200)),

                Text(
                  "Sign in to your Account",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),

                const Gap(8),

                Text(
                  "Enter your email and password to log in",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),

                Gap(AppSize.vGap),

                /// EMAIL
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your Password",
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_off_sharp),
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
                ),

                Gap(AppSize.vGap),

                /// REMEMBER
                Row(
                  children: const [
                    Icon(Icons.check_box_outline_blank),
                    SizedBox(width: 5),
                    Text("Remember me"),
                    Spacer(),
                    Text("Forget Password?"),
                  ],
                ),

                Gap(AppSize.vGap * 1.2),

                /// LOGIN BUTTON (LOADING STATE)
                Obx(() {
                  return SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: FilledButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              final email = emailController.text.trim();
                              final password = passwordController.text.trim();

                              if (email.isEmpty || password.isEmpty) {
                                Get.snackbar(
                                  "Error",
                                  "Email and password required",
                                );
                                return;
                              }

                              controller.login(email, password);
                            },
                      child: controller.isLoading.value
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text("Login", style: TextStyle(fontSize: 16)),
                    ),
                  );
                }),

                Gap(AppSize.vGap),

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

                Gap(AppSize.vGap),

                /// GOOGLE
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Image.asset("images/google.png", height: 22),
                    label: const Text("Continue with Google"),
                  ),
                ),

                Gap(AppSize.vGap),

                /// APPLE
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Get.to(() => RegisterView());
                    },
                    icon: const Icon(Icons.apple, size: 24),
                    label: const Text("Continue with Apple"),
                  ),
                ),

                Gap(AppSize.vGap * 1.5),

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
      ),
    );
  }
}
