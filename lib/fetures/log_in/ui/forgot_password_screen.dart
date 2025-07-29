import 'package:be_happy/core/widjets/custom_app_bar.dart';
import 'package:be_happy/core/widjets/text_form_field_with_titel.dart';
import 'package:be_happy/fetures/log_in/cubit/log_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Forgot PassWord",
        backgroundColor: Colors.white12,
        iconColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormFieldWithTitel(title: " Email", hintText: "Enter Your Email",
              controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LogInCubit>().sendResetPasswordEmail(
                      emailController.text.trim(),
                      context,
                    );
                  }
                },
                child: const Text("Send Reset Link"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
