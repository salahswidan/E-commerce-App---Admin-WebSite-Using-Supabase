import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/view/nav_bar/ui/main_home_view.dart';
import 'package:our_market/view/product_details/ui/logic/cubit/authentication_cubit.dart';
import '../../../core/components/custom_cicle_progress_indicator.dart';
import '../../../core/functions/show_msg.dart';
import 'widget/custom_row_with_arrow_btn.dart';
import 'widget/custom_text_button.dart';
import 'widget/custom_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SignUpSuccess || state is GoogleSignInSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainHomeView()));
        }
        if (state is SignUpError) {
          showMsg(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is SignUpLoading
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
                                  controller: _nameController,
                                  lableText: 'Name',
                                  keyboardType: TextInputType.name,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                 CustomTextFormField(
                                  controller: _emailController,
                                  lableText: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextFormField(
                                  controller: _passwordController,
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
                                CustomRowWithArrowBtn(
                                  text: "Sign Up",
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<AuthenticationCubit>()
                                          .register(
                                              name: _nameController.text,
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text);
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomRowWithArrowBtn(
                                  text: "Sign Up with Google",
                                  onTap: () {
                                    context
                                        .read<AuthenticationCubit>()
                                        .googleSignIn();
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Already have account?",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    CustomTextButton(
                                      text: 'Login In',
                                      onTap: () {
                                        Navigator.pop(context);
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
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
