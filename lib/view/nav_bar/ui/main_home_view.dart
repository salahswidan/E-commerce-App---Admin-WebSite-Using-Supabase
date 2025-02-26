import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:our_market/core/app_colors.dart';

import '../../favorite/ui/favorite_view.dart';
import '../../home/ui/home_view.dart';
import '../../profile/ui/profile_view.dart';
import '../../store/ui/store_view.dart';

class MainHomeView extends StatelessWidget {
  MainHomeView({super.key});
  final List<Widget> views = [
    const HomeView(),
    const StoreView(),
    const FavoriteView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: views[3],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: AppColors.kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: GNav(
              onTabChange: (value) {
                log(value.toString());
              },
              rippleColor: AppColors.kPrimaryColor,
              hoverColor: AppColors.kPrimaryColor,
              duration: const Duration(milliseconds: 400),
              gap: 8,
              color: Colors.grey,
              activeColor: Colors.white,
              iconSize: 24,
              tabBackgroundColor: AppColors.kPrimaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              tabs: [
                const GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                const GButton(
                  icon: Icons.store_mall_directory,
                  text: 'Store',
                ),
                const GButton(
                  icon: Icons.favorite,
                  text: 'Favorite',
                ),
                const GButton(
                  icon: Icons.person,
                  text: 'Profile',
                )
              ]),
        ),
      ),
    );
  }
}
