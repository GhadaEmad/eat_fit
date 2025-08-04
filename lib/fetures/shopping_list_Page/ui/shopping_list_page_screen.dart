//
//
// import 'package:flutter/material.dart';
//
// import '../data/shopping_items.dart';
//
// class ShoppingListPageScreen extends StatelessWidget {
//   const ShoppingListPageScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // قائمة ثابتة مؤقتًا (placeholder)
//
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('🛒 Shopping list'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Required ingredients:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//
//             // القائمة
//             Expanded(
//               child: ListView.separated(
//                 itemCount: shoppingItems.length,
//                 separatorBuilder: (context, index) => Divider(),
//                 itemBuilder: (context, index) {
//                   final item = shoppingItems[index];
//                   return Row(
//                     children: [
//                       Icon(Icons.circle_outlined, color: Colors.green),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: Text(
//                           item,
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../data/shopping_items.dart'; // ده لو عملتي الملف في core/data

class ShoppingListPageScreen extends StatelessWidget {
  const ShoppingListPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shopping List")),
      body: ListView.builder(
        itemCount: shoppingItems.length,
        itemBuilder: (context, index) {
          final item = shoppingItems[index];
          return ListTile(
            title: Text(item),
            trailing: Icon(Icons.check_box_outline_blank),
          );
        },
      ),
    );
  }
}
