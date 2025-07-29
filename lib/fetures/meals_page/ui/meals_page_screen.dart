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
            const Text('تفاصيل الوجبة', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Image.network('https://via.placeholder.com/150', height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16),
            const Text('اسم الوجبة: بيض مسلوق', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('السعرات: 150 Cal'),
            const SizedBox(height: 16),
            const Text('تفاصيل الوصفة هنا...'),
          ],
        ),
      ),
    );
  }
}
