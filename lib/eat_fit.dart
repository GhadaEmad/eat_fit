import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fetures/ lose_weight_plan/ui/lose_weight_plan_screen.dart';
import 'fetures/Account/ui/account_screen.dart';
import 'fetures/bmi/ui/bmi_screen.dart';
import 'fetures/choose_language/ui/choose_language_screen.dart';
import 'fetures/creat_account/ui/creat_account_screen.dart';
import 'fetures/log_in/ui/log_in_screen.dart';
import 'fetures/splash/ui/splash_screen.dart';
import 'fetures/gain_weight_plan/ui/gain_weight_plan_screen.dart';
import 'fetures/maintain_weight_plan/ui/maintain_weight_plan_screen.dart';
import 'fetures/about_app/ui/about_app_screen.dart';

class EatFit extends StatelessWidget {
  const EatFit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      // هنا بنراقب حالة تسجيل الدخول
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData) {
            return  HomeScreen(); // لو المستخدم مسجل دخول
          } else {
            return const SplashScreen(); // لو مش مسجل
          }
        },
      ),
      routes: <String, WidgetBuilder>{
        '/splash': (context) => const SplashScreen(),
        '/log_in': (context) => const LogInScreen(),
        '/create_account': (context) => const CreatAccountScreen(),
        '/bmi': (context) =>  HomeScreen(),
        '/lose_weight': (context) => const LoseWeightPlanScreen(),
        '/gain_weight': (context) => const GainWeightPlanScreen(),
        '/maintain_weight': (context) => const MaintainWeightPlanScreen(),
        '/account': (context) => const AccountScreen(),
        '/choose_language': (context) => const ChooseLanguageScreen(),
        '/about_app': (context) => const AboutAppScreen(),
      },
    );
  }
}
