

import 'package:flutter/material.dart';

import '../../fetures/plan_page/data/meal_model.dart';

class MealCard extends StatelessWidget {
  final MealModel meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Navigator.pushReplacementNamed(context, '/meal_details');
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: 180,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text(meal.type!, style: TextStyle(fontWeight: FontWeight.bold))),
              Image.asset(meal.imageUrl!, height: 120, width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(meal.name!, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('${meal.calories} Cal'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {

                  Navigator.pushReplacementNamed(context, '/meal_details');
                },
                child: Text('meal_details'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
