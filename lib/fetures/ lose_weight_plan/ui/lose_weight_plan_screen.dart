import 'package:be_happy/core/helpers/app_colors.dart';
import 'package:be_happy/core/widjets/custom_app_bar.dart';
import 'package:be_happy/fetures/meals_page/ui/meals_page_screen.dart';
import 'package:be_happy/fetures/plan_page/ui/plan_page_screen.dart';
import 'package:be_happy/fetures/settings_page/ui/settings_page_screen.dart';
import 'package:be_happy/fetures/shopping_list_Page/ui/shopping_list_page_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/widjets/custom_bottom_nav_bar.dart';

class LoseWeightPlanScreen extends StatefulWidget {
  const LoseWeightPlanScreen({super.key});

  @override
  State<LoseWeightPlanScreen> createState() => _LoseWeightPlanScreenState();
}

class _LoseWeightPlanScreenState extends State<LoseWeightPlanScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    PlanPageScreen(),
    MealsPageScreen(),
    ShoppingListPageScreen(),
    SettingsPageScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(title: "Lose Weight Plan",backgroundColor:AppColors.secondaryColor ,iconColor: Colors.white,),

      body: pages[currentIndex],


      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),


    );
  }
}