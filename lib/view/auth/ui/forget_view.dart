import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/core/functions/show_msg.dart';
import 'package:our_market/view/auth/logic/cubit/authentication_cubit.dart';
import '../../../core/components/custom_cicle_progress_indicator.dart';
import 'widget/custom_elevated_btn.dart';
import 'widget/custom_text_field.dart';

class ForgetView extends StatefulWidget {
  const ForgetView({super.key});

  @override
  State<ForgetView> createState() => _ForgetViewState();
}

class _ForgetViewState extends State<ForgetView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is PasswordResetSuccess) {
          Navigator.pop(context);
          showMsg(context, "Email Was Sent");
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is PasswordResetLoading
              ? CustomCircleIndicator()
              : SafeArea(
                  child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Enter Your Email To Reset Password",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
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
                              CustomEBtn(
                                text: 'Sybmit',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    context
                                        .read<AuthenticationCubit>()
                                        .resetPassword(
                                            email: emailController.text);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
