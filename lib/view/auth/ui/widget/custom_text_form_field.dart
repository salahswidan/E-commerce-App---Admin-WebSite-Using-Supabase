
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.lableText,
    this.suffixIcon,
    this.isSecured = false, this.keyboardType,
  });
  final String lableText;
  final Widget? suffixIcon;
  final bool isSecured;
  final TextInputType? keyboardType;

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
      keyboardType: keyboardType,
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
