import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:our_market/core/app_colors.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          child: const Text("Test View"),
        ),
      )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: AppColors.kWhiteColor),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: GNav(
              rippleColor: AppColors.kPrimaryColor,
              hoverColor: AppColors.kPrimaryColor,
              duration: Duration(milliseconds: 400),
              gap: 8,
              color: Colors.grey,
              activeColor: Colors.white,
              iconSize: 24,
              tabBackgroundColor: AppColors.kPrimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.store_mall_directory,
                  text: 'Store',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favorite',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                )
              ]),
        ),
      ),
    );
  }
}
