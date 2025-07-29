

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
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: 180,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('$meal.imageUrl', height: 100, width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 8),
              Text('$meal.name', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${meal.calories} Cal'),
              Spacer(),
              ElevatedButton(
                onPressed: () {

                  Navigator.pushReplacementNamed(context, '/meal_details');
                },
                child: Text('عرض التفاصيل'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
