import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:hello_world/controllers/auth_controller.dart';
import 'package:hello_world/utils/app_size.dart';
import 'package:hello_world/views/Auth_view/register_view.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

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
                  controller: controller.email,
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

                /// PASSWORD
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
                        print("Login Button Clicked");
                        await controller.login();
                        print("Login Success");
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
                    child: const Text("Login", style: TextStyle(fontSize: 16)),
                  ),
                ),

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
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => const RegisterView());
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
    );
  }
}
