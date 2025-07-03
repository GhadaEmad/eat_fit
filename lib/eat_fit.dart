
import 'package:be_happy/fetures/Account/ui/account_screen.dart';
import 'package:be_happy/fetures/bmi/ui/bmi_screen.dart';
import 'package:be_happy/fetures/bmi/ui/result_screen.dart';
import 'package:be_happy/fetures/choose_language/ui/choose_language_screen.dart';
import 'package:be_happy/fetures/creat_account/ui/creat_account_screen.dart';
import 'package:be_happy/fetures/log_in/ui/log_in_screen.dart';
import 'package:be_happy/fetures/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fetures/ lose_weight_plan/ui/lose_weight_plan_screen.dart';
import 'fetures/about_app/ui/about_app_screen.dart';
import 'fetures/gain_weight_plan/ui/gain_weight_plan_screen.dart';
import 'fetures/maintain_weight_plan/ui/maintain_weight_plan_screen.dart';

class EatFit extends StatelessWidget {
  const EatFit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),

      ),
      initialRoute:'/splash',
      routes: <String,WidgetBuilder>{
        '/splash':(context)=>SplashScreen(),
        '/log_in':(context)=>LogInScreen(),
        '/create_account':(context)=>CreatAccountScreen(),
        '/bmi':(context)=>HomeScreen(),
        '/lose_weight': (context) => LoseWeightPlanScreen(),
        '/gain_weight': (context) => GainWeightPlanScreen(),
        '/maintain_weight': (context) => MaintainWeightPlanScreen(),
        '/account':(context)=> AccountScreen(),
        '/choose_language':(context)=>ChooseLanguageScreen(),
        '/about_app': (context) => AboutAppScreen(),

      },

    );
  }
}