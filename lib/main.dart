import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/core/my_observer.dart';
import 'package:our_market/view/auth/ui/login_view.dart';
import 'package:our_market/view/nav_bar/ui/main_home_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/sensitive_data.dart';
import 'view/auth/logic/cubit/authentication_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fkjveyulwgvqmkuqllmi.supabase.co',
    anonKey: anonkey,
  );
  Bloc.observer = MyObserver();
  runApp(const OurMarket());
}

class OurMarket extends StatelessWidget {
  const OurMarket({super.key});

  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;
    return BlocProvider(
      create: (context) => AuthenticationCubit()..getUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Our Market',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kScaffoldColor,
          useMaterial3: true,
        ),
        home: client.auth.currentUser != null ? MainHomeView(
          userDataModel: context.read<AuthenticationCubit>().userDataModel!,
        ) : LoginView(),
      ),
    );
  }
}
