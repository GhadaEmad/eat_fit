

import 'package:flutter/material.dart';

import '../../../core/widjets/meal_card.dart';
import '../../meals_page/data/meal_model.dart';

class PlanPageScreen extends StatelessWidget {
  final List<String> days = [
    'Wednesday', 'Thursday ', 'Friday', 'Saturday', 'Sunday', 'Monday', 'Tuesday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Daily Meals', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: days.length,
                itemBuilder: (context, index) {
                  String currentDay = days[index];
                  List<MealModel> mealsOfDay = allMeals.where((m) => m.day == currentDay).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$currentDay - ${DateTime.now().add(Duration(days: index)).toLocal().toString().split(" ")[0]}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                      height:   250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mealsOfDay.length,
                          itemBuilder: (context, mealIndex) {
                            return MealCard(meal: mealsOfDay[mealIndex]);
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }}

