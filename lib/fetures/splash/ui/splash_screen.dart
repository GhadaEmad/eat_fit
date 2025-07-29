import 'package:flutter/material.dart';

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
    Future.delayed(Duration(seconds: 3), () {
      return Navigator.pushReplacementNamed(context, '/log_in');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_dining, size: 50, color: Colors.green,),
            SizedBox(height: 20,),
            Text("Eat Fit", style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
