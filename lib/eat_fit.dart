import 'package:be_happy/fetures/creat_account/cubit/creat_account_cubit.dart';
import 'package:be_happy/fetures/log_in/cubit/log_in_cubit.dart';
import 'package:be_happy/fetures/meals_page/ui/meals_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fetures/ lose_weight_plan/ui/lose_weight_plan_screen.dart';
import 'fetures/Account/ui/account_screen.dart';
import 'fetures/bmi/ui/bmi_screen.dart';
import 'fetures/choose_language/ui/choose_language_screen.dart';
import 'fetures/creat_account/ui/creat_account_screen.dart';
import 'fetures/log_in/data/repo/auth_repo.dart';
import 'fetures/log_in/ui/forgot_password_screen.dart';
import 'fetures/log_in/ui/log_in_screen.dart';
import 'fetures/splash/ui/splash_screen.dart';
import 'fetures/gain_weight_plan/ui/gain_weight_plan_screen.dart';
import 'fetures/maintain_weight_plan/ui/maintain_weight_plan_screen.dart';
import 'fetures/about_app/ui/about_app_screen.dart';

class EatFit extends StatelessWidget {
  const EatFit({super.key});


  @override
  Widget build(BuildContext context) {
    Future<String?> _getUserGoal() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('goal'); // ممكن تكون 'lose' أو 'gain' أو 'maintain'
    }

    final authRepository = AuthRepository();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData) {
            // ✅ المستخدم مسجل دخول، نروح نتحقق من الهدف
            return FutureBuilder<String?>(
              future: _getUserGoal(),
              builder: (context, goalSnapshot) {
                if (goalSnapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                }

                final goal = goalSnapshot.data;

                if (goal == null) {
                  return HomeScreen(); // لسه ما اختارش هدف
                }

                // ✅ نوجه المستخدم حسب الهدف
                switch (goal) {
                  case 'lose':
                    return const LoseWeightPlanScreen();
                  case 'gain':
                    return const GainWeightPlanScreen();
                  case 'maintain':
                    return const MaintainWeightPlanScreen();
                  default:
                    return HomeScreen();
                }
              },
            );
          } else {
            // ❌ مش مسجل دخول
            return BlocProvider(
              create: (context) => LogInCubit(authRepository: authRepository),
              child: const LogInScreen(),
            );
          }
        },
      ),


    routes: <String, WidgetBuilder>{
        '/splash': (context) => const SplashScreen(),
      '/meal_details': (context) => const MealsPageScreen(),
        '/log_in': (context) =>   BlocProvider(
    create: (context) =>LogInCubit(authRepository: authRepository),
    child: const LogInScreen(),
    ),
        '/create_account': (context) =>  BlocProvider(
         create: (context) => CreatAccountCubit(),
          child: const CreatAccountScreen(),
        ),
        '/bmi': (context) =>  HomeScreen(),
        '/lose_weight': (context) => const LoseWeightPlanScreen(),
        '/gain_weight': (context) => const GainWeightPlanScreen(),
        '/maintain_weight': (context) => const MaintainWeightPlanScreen(),
        '/account': (context) => const AccountScreen(),
        '/choose_language': (context) => const ChooseLanguageScreen(),
        '/about_app': (context) => const AboutAppScreen(),
        '/forgot_password': (context) => BlocProvider.value(
          value: BlocProvider.of<LogInCubit>(context),
          child: const ForgotPasswordScreen(),
        ),


      },
    );
  }
}
