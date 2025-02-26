import 'package:flutter/material.dart';
import 'package:our_market/core/app_colors.dart';
import 'widget/custom_elevated_btn.dart';
import 'widget/custom_row_with_arrow_btn.dart';
import 'widget/custom_text_button.dart';
import 'widget/custom_text_form_field.dart';

class ForgetView extends StatelessWidget {
  const ForgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Enter Your Email To Reset Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  const CustomTextFormField(
                    lableText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomEBtn(
                    text: 'Sybmit',
                    onTap: () {},
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

