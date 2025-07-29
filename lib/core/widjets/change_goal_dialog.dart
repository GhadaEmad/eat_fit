import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeGoalDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Select Your Goal"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("Lose Weight"),
              onTap: () => _saveGoalAndNavigate(context, "lose"),
            ),
            ListTile(
              title: const Text("Gain Weight"),
              onTap: () => _saveGoalAndNavigate(context, "gain"),
            ),
            ListTile(
              title: const Text("Maintain Weight"),
              onTap: () => _saveGoalAndNavigate(context, "maintain"),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> _saveGoalAndNavigate(BuildContext context, String goal) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('goal', goal);
    Navigator.pop(context); // يغلق الـ dialog

    // التنقل حسب الهدف
    switch (goal) {
      case "lose":
        Navigator.pushReplacementNamed(context, "/lose_weight");
        break;
      case "gain":
        Navigator.pushReplacementNamed(context, "/gain_weight");
        break;
      case "maintain":
        Navigator.pushReplacementNamed(context, "/maintain_weight");
        break;
    }
  }
}
