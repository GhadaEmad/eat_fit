import 'package:be_happy/core/helpers/extension.dart';
import 'package:be_happy/core/widjets/button_with_titel.dart';
import 'package:be_happy/core/widjets/custom_app_bar.dart';
import 'package:be_happy/core/widjets/text_form_field_with_titel.dart';
import 'package:flutter/material.dart';
import '../../bmi/ui/bmi_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: CustomAppBar(title: "Log In",backgroundColor: Colors.white12,iconColor: Colors.white,),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormFieldWithTitel(
                title: "Email",
                hintText: "Enter your Email",
                controller: emailController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "enter this valid";
                  } else if (!emailController.text.toString().isValidEmail) {
                    return "please enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormFieldWithTitel(
                title: "Password",
                hintText: "Enter your password",
                controller: passwordController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "please enter password";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ButtonWithTitel(
              titel: "Log In",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                  Navigator.pushReplacementNamed(context,'/bmi');

                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
