
import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';


class InformationContainer extends StatelessWidget {
  final String text;
  final int point;
  void Function()? incremint;
  void Function()? decremint;

 InformationContainer({super.key, required this.text, required this.point,this.incremint,this.decremint}) {

 }

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:AppColors.secondaryColor
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
              style: TextStyle(fontSize: 20,
                  color: AppColors.textGrayColor
              ),),
            Text("$point",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                FloatingActionButton.small(onPressed:decremint,
                  shape: CircleBorder(),
                  backgroundColor: Colors.green[300],
                  child: Icon(Icons.remove,color: Colors.white,),
                ),
                FloatingActionButton.small(onPressed: incremint,
                  shape: CircleBorder(),
                  backgroundColor: Colors.green[300],
                  child: Icon(Icons.add,color: Colors.white,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
