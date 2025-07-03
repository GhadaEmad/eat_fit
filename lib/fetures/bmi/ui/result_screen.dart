import 'dart:math';
import 'package:be_happy/core/helpers/cach_helpers.dart';
import 'package:flutter/material.dart';
import '../../../core/helpers/app_colors.dart';
import '../../../core/widjets/custom_app_bar.dart';

class ResultScreen extends StatelessWidget {
  final int weight;
  final double height;
  final int age;
  const ResultScreen({super.key, required this.weight, required this.height, required this.age});

  void navigateToGoalPage(BuildContext context, String goal) {
    if (goal == 'Lose Weight') {
      Navigator.pushNamedAndRemoveUntil(context, '/lose_weight',(route) => false,);
    } else if (goal == 'Gain Weight') {
      Navigator.pushNamedAndRemoveUntil(context, '/gain_weight',(route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/maintain_weight',(route) => false);
    }
  }
  // Future<void> saveGoal(String goal) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('user_goal', goal);
  // }
  double convertheight(){
    return height/100;
  }
  double clcBMI(){
    return weight/(pow(convertheight(), 2));
  }
  String getWeightAdvice() {
    if (clcBMI() < 18.4) {
      return ("Your weight is under normal, it is better to gain a little weight 🍽️");
    }

    else if (clcBMI() > 18.4 && clcBMI() < 24.9) {
      return (" Your weight is ideal, maintain it 💪");
    } else if (clcBMI() >= 25 && clcBMI() <= 39.9) {
      return (" You are overweight, it is better to start a weight loss plan 🌿");
    } else {
      return ("You are suffering from extreme obesity. It is recommended to visit a doctor and follow up with an urgent nutritional plan. ⚠️🍎");
    }}

  String textResult(){
    if (clcBMI() < 18.4) {
      return ("UnderWeight");
    }
    else if (clcBMI() > 18.4 && clcBMI() < 24.9) {
      return (" Normal");
    } else if (clcBMI() >= 25 && clcBMI() <= 39.9) {
      return (" OverWeight");
    } else {
      return ("obese");
    }

  }
  String getSuggestedGoal() {
    double bmi = clcBMI();
    if (bmi < 18.5) {
      return "Gain Weight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "Maintain Weight";
    } else {
      return "Lose Weight";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: CustomAppBar(title: "BMI Calculator",backgroundColor:AppColors.secondaryColor,iconColor: Colors.white,),

        body:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24),
          child: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Result ", style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),),
                SizedBox(height: 25,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 52),
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text("${textResult()}", style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.green),),
                      SizedBox(height: 33,),
                      Text("${clcBMI().toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),),
                      SizedBox(height: 60,),
                      Text(getWeightAdvice(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGrayColor,
                        ),
                      ),


                    ],

                  ),

                ),
                SizedBox(height: 50,),
                Center(
                  child: ElevatedButton(

                    style:ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9FE2BF),
                        fixedSize: Size(200,50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),

                    onPressed: (){
                     Navigator.pushNamed(context, '/bmi');
                    }, child: Text(" Re Calculate",style: TextStyle(fontSize: 20,color: Colors.white),),),

                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color(0xFF9FE2BF),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {

                      final selectedGoal = getSuggestedGoal();
                      await CacheData.SetData(key: "goal", value: selectedGoal );// تحديد الهدف
                            debugPrint("goal is store");
                      navigateToGoalPage(context, selectedGoal);  // التوجيه حسب الهدف
                    },


                    child: Text("Start by ${getSuggestedGoal()}", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),

                ),


              ],
            ),
          ),
        )
    );
  }
}
