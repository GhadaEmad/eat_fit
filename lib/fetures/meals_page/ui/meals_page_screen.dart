import 'package:flutter/material.dart';

import '../../plan_page/data/meal_model.dart';

class MealsPageScreen extends StatelessWidget {
  const MealsPageScreen({super.key});

  final List<String> days = const [
    'السبت', 'الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة'
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Meal Details', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Image.asset('assets/image/breakfast.jpg', height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16),
            const Text('Name of Meal: Boiled eggs + salad + slice of toast', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('calores: 150 Cal'),
            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
