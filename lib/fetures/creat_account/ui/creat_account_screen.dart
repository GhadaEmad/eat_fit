
import 'package:be_happy/core/helpers/extension.dart';
import 'package:be_happy/core/widjets/button_with_titel.dart';
import 'package:be_happy/core/widjets/text_form_field_with_titel.dart';
import 'package:be_happy/fetures/bmi/ui/bmi_screen.dart';
import 'package:be_happy/fetures/log_in/ui/log_in_screen.dart';
import 'package:flutter/material.dart';

class CreatAccountScreen extends StatefulWidget {
  const CreatAccountScreen({super.key});

  @override
  State<CreatAccountScreen> createState() => _CreatAccountScreenState();
}

class _CreatAccountScreenState extends State<CreatAccountScreen> {
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var confirmationPassController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
  nameController.dispose();
  emailController.dispose();
  passwordController.dispose();
  confirmationPassController.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:Colors.green[100],
    body:
    SafeArea(
        child: Form(

          key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.symmetric(vertical:16,horizontal: 20),
            child: Column(

              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [

                Center(child: Icon(Icons.local_dining,size: 50,color: Colors.green)),
                SizedBox(height: 10,),
                Center(child: Text("Creat Account",style: TextStyle(color: Colors.green,fontSize: 25),)),
                SizedBox(height: 8,),
                TextFormFieldWithTitel(
                  title: "Name",
                  hintText: "Enter your name",
                  controller:nameController ,
                  validator: (v){
                if(v==null || v.isEmpty){
                  return "name is required";
                }
                  },
                ),
            SizedBox(height: 5,),
                TextFormFieldWithTitel(
                  title: "Email",
                  hintText: "Enter your email",
                  controller:emailController ,
                  validator: (v){
                    if(v==null || v.isEmpty ){
                      return "email is required";
                    }else if(!emailController.text.toString().isValidEmail){
                      return "please enter the valid email";
                    }

                  },
                ),
                SizedBox(height: 5,),
                TextFormFieldWithTitel(
                  title: "Password",
                  hintText: "Enter your password",
                  controller:passwordController ,
                  validator: (v){
                    if(v==null || v.isEmpty){
                      return "password is required";
                    }
                  },
                ),
                SizedBox(height: 5,),
                TextFormFieldWithTitel(
                  title: "Confirm password",
                  hintText: "Enter Confirm password",
                  controller:confirmationPassController ,
                  validator: (v){
                    if(v==null || v.isEmpty){
                      return "name is required";
                    }else if(confirmationPassController.text!=passwordController.text){
                      return "confirmation password must be same as password";
                    }
                  },
                ),
                SizedBox(height: 20,),
                ButtonWithTitel(titel: "Creat Accont",onPressed: (){
                  if (formKey.currentState!.validate()) {
                   Navigator.pushReplacementNamed(context, '/bmi');
                  }
                }),
                SizedBox(height: 10,),
               Row(
                 mainAxisAlignment:MainAxisAlignment.center ,
                 children: [
                   Text("Already have an Account?"),
                   InkWell(onTap:(){
                     Navigator.pushReplacementNamed(context , '/log_in' );

                   },child: Text("login",style: TextStyle(color: Colors.red),))
                 ],
               )
              ],
            ),
          ),
        ),
            ),
      ));
  }
}
