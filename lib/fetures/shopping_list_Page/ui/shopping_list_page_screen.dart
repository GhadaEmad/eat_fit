

import 'package:flutter/material.dart';

class ShoppingListPageScreen extends StatelessWidget {
  const ShoppingListPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة ثابتة مؤقتًا (placeholder)
    final List<String> shoppingItems = [
      'بيض',
      'خس',
      'طماطم',
      'شوفان',
      'لبن',
      'خبز توست',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('🛒 قائمة المشتريات'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'المكونات المطلوبة:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // القائمة
            Expanded(
              child: ListView.separated(
                itemCount: shoppingItems.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final item = shoppingItems[index];
                  return Row(
                    children: [
                      Icon(Icons.circle_outlined, color: Colors.green),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
