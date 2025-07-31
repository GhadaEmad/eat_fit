import 'package:be_happy/core/widjets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../data/meal_model.dart';

class MealsPageScreen extends StatelessWidget {
  const MealsPageScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final MealModel? meal = arguments is MealModel ? arguments : null;
    if (arguments == null ) {
      // ✅ يعني جاي من BottomNavigation مش من كارت → اعرض رسالة بسيطة أو صفحة فاضية
      return Scaffold(
        appBar: AppBar(title: Text("Meal Details"),centerTitle: true,),
        body: Center(
          child: Text(
            "There is no meal data to display right now.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title:' Meal'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Meal Details', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Image.asset(meal!.imageUrl ?? 'assets/image/breakfast.jpg',height: 200, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text('Name of Meal: ${meal.name ?? 'Boiled eggs + salad + slice of toast'}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Calories: ${meal.calories} Cal'),
              const SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }
}
