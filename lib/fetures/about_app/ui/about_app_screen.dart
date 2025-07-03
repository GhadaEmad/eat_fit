import 'package:be_happy/core/helpers/app_colors.dart';
import 'package:be_happy/core/widjets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: CustomAppBar(title: "About App",backgroundColor: AppColors.secondaryColor,iconColor: Colors.white,),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Be Happy",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 12),
            Text(
              "Version: 1.0.0",
              style: TextStyle(fontSize: 16,color:Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Be Happy is a healthy lifestyle app that helps you track your meals, workouts, water intake, and stay on track with your goals.",
              style: TextStyle(fontSize: 16,color:Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }
}
