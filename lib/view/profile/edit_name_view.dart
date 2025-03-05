import 'package:flutter/material.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/view/auth/ui/widget/custom_elevated_btn.dart';
import 'package:our_market/view/auth/ui/widget/custom_text_field.dart';

import '../../core/functions/build_appBar.dart';

class EditNameView extends StatelessWidget {
  const EditNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar( context,"Edit Name"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              lableText: "Enter your name",
            ),
            SizedBox(
              height: 15,
            ),
            CustomEBtn(text: "Update", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
