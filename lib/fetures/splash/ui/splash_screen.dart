

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../creat_account/ui/creat_account_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),()
    {
      Navigator.pushReplacementNamed(context, '/create_account');

    });
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body:
      Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            Icon(Icons.local_dining,size: 50,color: Colors.green,),
            SizedBox(height: 20,),
            Text("Eat Fit",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green)) ,
          ],
        ),
      ),
    );
  }
}
