
import 'package:be_happy/core/helpers/app_colors.dart';
import 'package:be_happy/core/widjets/custom_card.dart';
import 'package:flutter/material.dart';

class SettingsPageScreen extends StatelessWidget {
  const SettingsPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body:SingleChildScrollView(
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              CustomCard(icon: Icons.person, titel: "Account", onTap: (){
                Navigator.pushNamed(context, '/account');
              }),
              const SizedBox(height: 12),
              CustomCard(icon: Icons.notifications, titel: "Notifications", onTap: (){
              }
              ),
              const SizedBox(height: 12),

              CustomCard(icon: Icons.dark_mode, titel: "Dark Mode", onTap: (){}),
              const SizedBox(height: 12),
              CustomCard(icon: Icons.language, titel: "Change Language", onTap: (){
               // Navigator.pushNamed(context, '/choose_language');
              }),
              const SizedBox(height: 12),
              CustomCard(icon: Icons.autorenew, titel: "Change Goal", onTap: (){}),
              const SizedBox(height: 12),
              CustomCard(icon: Icons.info_outline, titel: "About App", onTap: (){
                Navigator.pushNamed(context, '/about_app');
              }),
              const SizedBox(height: 12),
              CustomCard(icon: Icons.logout, titel: "Log Out", onTap: (){}),
            ],
          ),
        ),
      )

    );
  }
}
