import 'package:flutter/material.dart';

class SettingsMenuButton extends StatelessWidget {
  const SettingsMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, color: Colors.black),
      onSelected: (value) {
        switch (value) {
          case 'account':
            Navigator.pushNamed(context, '/account');
            break;
          case 'notifications':
            break;
          case 'privacy':
            break;
          case 'dark_mode':
            break;
          case 'change_language':
            break;
          case 'change_goal':
            break;
          case 'about_app':
            Navigator.pushNamed(context, '/about_app');
            break;
          case 'logout':
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'account', child: Text('Account')),
        const PopupMenuItem(value: 'notifications', child: Text('Notifications')),
        const PopupMenuItem(value: 'privacy', child: Text('Privacy')),
        const PopupMenuItem(value: 'dark_mode', child: Text('Dark Mode')),
        const PopupMenuItem(value: 'change_language', child: Text('Change Language')),
        const PopupMenuItem(value: 'change_goal', child: Text('Change Goal')),
        const PopupMenuItem(value: 'about_app', child: Text('About App')),
        const PopupMenuItem(value: 'logout', child: Text('Log Out')),
      ],
    );
  }
}
