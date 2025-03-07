import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/core/components/custom_cicle_progress_indicator.dart';
import 'package:our_market/view/auth/ui/forget_view.dart';
import 'package:our_market/view/auth/ui/sign_up_view.dart';
import 'package:our_market/view/nav_bar/ui/main_home_view.dart';
import '../../../core/functions/navigate_to.dart';
import '../../../core/functions/show_msg.dart';
import '../../product_details/ui/logic/cubit/authentication_cubit.dart';
import 'widget/custom_row_with_arrow_btn.dart';
import 'widget/custom_text_button.dart';
import 'widget/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
          if (state is LoginSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainHomeView()));
        }
        if (state is LoginError) {
          showMsg(context, state.message);
        }
      },
      builder: (context, state) {
        AuthenticationCubit cubit = context.read<AuthenticationCubit>();
        return Scaffold(
          body: state is LoginLoading
              ? CustomCircleIndicator()
              : SafeArea(
                  child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          "Welcome To Our Market",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
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
                                CustomTextFormField(
                                  controller: emailController,
                                  lableText: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                  suffixIcon: Icon(Icons.email),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextFormField(
                                  controller: passwordController,
                                  isSecured: isPasswordHidden,
                                  lableText: 'Password',
                                  keyboardType: TextInputType.visiblePassword,
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isPasswordHidden =
                                              !isPasswordHidden;
                                        });
                                      },
                                      icon:  Icon(isPasswordHidden ? Icons.visibility : Icons.visibility_off)),
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
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        cubit.login(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomRowWithArrowBtn(
                                  text: "Login with Google",
                                  onTap: () {
                                    naviagteTo(context, MainHomeView());
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
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
                  ),
                )),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  
}
