import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hello_world/utils/app_size.dart';
import 'package:hello_world/views/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: SafeArea(
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

                /// EMAIL FIELD
                TextFormField(
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

                /// PASSWORD FIELD
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your Password",

                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_off_sharp),
                    ),

                    // filled: true,
                    // fillColor: Colors.grey.shade100,
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

                /// REMEMBER + FORGOT
                Row(
                  children: const [
                    Icon(Icons.check_box_outline_blank),
                    Text(
                      "Remember me",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),

                    Spacer(),

                    Text(
                      "Forget Password?",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                Gap(AppSize.vGap * 1.2),

                /// LOGIN BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Login", style: TextStyle(fontSize: 16)),
                  ),
                ),

                Gap(AppSize.vGap),

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

                Gap(AppSize.vGap),

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
                    onPressed: () {
                      Get.to(() => RegisterView());
                    },
                    icon: const Icon(Icons.apple, size: 24),
                    label: const Text("Continue with Apple"),
                  ),
                ),

                Gap(AppSize.vGap * 1.5),

                /// SIGN UP
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
