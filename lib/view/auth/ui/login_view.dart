import 'package:flutter/material.dart';
import 'package:our_market/core/app_colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    suffixIcon: Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    isSecured: true,
                    lableText: 'Password',
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
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onTap,
    required this.text,
  });
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.lableText,
    this.suffixIcon,
    this.isSecured = false,
  });
  final String lableText;
  final Widget? suffixIcon;
  final bool isSecured;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecured,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: lableText,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.kBordersideColor, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.kBordersideColor, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.kBordersideColor, width: 2),
            borderRadius: BorderRadius.circular(16),
          )),
    );
  }
}
