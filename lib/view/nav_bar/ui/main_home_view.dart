import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/view/auth/logic/cubit/models/user_model.dart';
import '../../favorite/ui/favorite_view.dart';
import '../../home/ui/home_view.dart';
import '../../profile/ui/profile_view.dart';
import '../../store/ui/store_view.dart';
import '../logic/cubit/nav_bar_cubit.dart';

class MainHomeView extends StatefulWidget {
  MainHomeView({super.key,  
 required  this.userDataModel
 });
  final UserDataModel userDataModel;

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  late List<Widget> views;
  @override
  void initState() {
  views = [
      HomeView(
        userDataModel: widget.userDataModel!,
      ),
      const StoreView(),
      const FavoriteView(),
      const ProfileView()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NavBarCubit(),
        child: BlocBuilder<NavBarCubit, NavBarState>(
          builder: (context, state) {
            NavBarCubit cubit = context.read<NavBarCubit>();
            return Scaffold(
              body: SafeArea(
                child: views[cubit.currentIndex],
              ),
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(color: AppColors.kWhiteColor),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: GNav(
                      onTabChange: (index) {
                        cubit.changeCurrentIndex(index);
                      },
                      rippleColor: AppColors.kPrimaryColor,
                      hoverColor: AppColors.kPrimaryColor,
                      duration: const Duration(milliseconds: 400),
                      gap: 8,
                      color: Colors.grey,
                      activeColor: Colors.white,
                      iconSize: 24,
                      tabBackgroundColor: AppColors.kPrimaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
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
          },
        ));
  }
}
