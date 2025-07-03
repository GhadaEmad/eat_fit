import 'package:flutter/material.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Language"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Text("🇸🇦", style: TextStyle(fontSize: 24)),
            title: const Text("العربية"),
            onTap: () {
              // تغيير اللغة إلى العربية
              // حفظها مثلاً في SharedPreferences
              // إعادة تشغيل أو تحديث التطبيق
              print("تم اختيار العربية");
            },
          ),
          ListTile(
            leading: const Text("🇺🇸", style: TextStyle(fontSize: 24)),
            title: const Text("English"),
            onTap: () {
              // تغيير اللغة إلى الإنجليزية
              print("English selected");
            },
          ),
        ],
      ),
    );
  }
}
