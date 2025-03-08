import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/components/custom_cicle_progress_indicator.dart';
import 'package:our_market/core/functions/navigate_to.dart';
import 'package:our_market/view/auth/ui/login_view.dart';
import 'package:our_market/view/profile/edit_name_view.dart';
import 'package:our_market/view/profile/ui/my_orders.dart';
import '../../../core/app_colors.dart';
import '../../../core/functions/navigate_without_back.dart';
import '../../product_details/ui/logic/cubit/authentication_cubit.dart';
import 'widgets/custom_row_btn.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
                    naviagteWithoutBack(context,  LoginView());

        }
      },
      builder: (context, state) {
        return state is LogoutLoading ? CustomCircleIndicator() :   Center(
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
                      onTap: () => naviagteTo(context, MyOrdersView()),
                      icon: Icons.shopping_basket,
                      text: 'My Orders',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomRowBtn(
                      onTap: ()async {
                       await context.read<AuthenticationCubit>().signOut();
                      },
                      icon: Icons.logout,
                      text: 'Logout',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
