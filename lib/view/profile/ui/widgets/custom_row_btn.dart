
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CustomRowBtn extends StatelessWidget {
  const CustomRowBtn({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });
  final void Function() onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(
              icon,
              size: 45,
              color: Colors.white,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColors.kWhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            )
          ]),
        ),
      ),
    );
  }
}
