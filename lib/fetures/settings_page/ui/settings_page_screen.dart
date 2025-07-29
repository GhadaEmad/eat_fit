
import 'package:be_happy/core/helpers/app_colors.dart';
import 'package:be_happy/core/widjets/custom_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widjets/change_goal_dialog.dart';
import '../../log_in/cubit/log_in_cubit.dart';
import '../../log_in/data/repo/auth_repo.dart';
import '../../log_in/ui/log_in_screen.dart';

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
              CustomCard(icon: Icons.autorenew, titel: "Change Goal", onTap: (){
                ChangeGoalDialog.show(context);
              }),
              const SizedBox(height: 12),
              CustomCard(icon: Icons.info_outline, titel: "About App", onTap: (){
                Navigator.pushNamed(context, '/about_app');
              }),
              const SizedBox(height: 12),
              CustomCard(
                icon: Icons.logout,
                titel: "Log Out",
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil('/log_in', (route) => false);
                },
              )



            ],
          ),
        ),
      )

    );
  }
}
