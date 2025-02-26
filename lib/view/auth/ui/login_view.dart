import 'package:flutter/material.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/view/auth/ui/forget_view.dart';
import 'package:our_market/view/auth/ui/sign_up_view.dart';
import 'package:our_market/view/nav_bar/ui/main_home_view.dart';

import '../../../core/functions/navigate_to.dart';
import 'widget/custom_row_with_arrow_btn.dart';
import 'widget/custom_text_button.dart';
import 'widget/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Welcome To Our Market",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            Card(
              margin: const EdgeInsets.all(24),
              color: AppColors.kWhiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const CustomTextFormField(
                      lableText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icon(Icons.email),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      isSecured: true,
                      lableText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_off)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                          text: 'Forgot Password?',
                          onTap: () {
                            naviagteTo(context, const ForgetView());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomRowWithArrowBtn(
                      text: "Login",
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomRowWithArrowBtn(
                      text: "Login with Google",
                      onTap: () {
                        naviagteTo(context,  MainHomeView());
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomTextButton(
                          text: 'Sign Up',
                          onTap: () {
                            naviagteTo(context, const SignUpView());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
