import 'package:flutter/material.dart';
import 'package:our_market/core/functions/navigate_to.dart';
import 'package:our_market/view/profile/edit_name_view.dart';

import '../../../core/app_colors.dart';
import 'widgets/custom_row_btn.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.65,
        child: Card(
          margin: const EdgeInsets.all(24),
          color: AppColors.kWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                  child: Icon(
                    Icons.person,
                    size: 45,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Usert Email',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomRowBtn(
                  onTap: () => naviagteTo(context, EditNameView()),
                  icon: Icons.person,
                  text: 'Edit Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomRowBtn(
                  onTap: () {},
                  icon: Icons.shopping_basket,
                  text: 'My Orders',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomRowBtn(
                  onTap: () {},
                  icon: Icons.logout,
                  text: 'Logout',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
