import 'package:be_happy/core/helpers/extension.dart';
import 'package:be_happy/core/widjets/button_with_titel.dart';
import 'package:be_happy/core/widjets/custom_app_bar.dart';
import 'package:be_happy/core/widjets/text_form_field_with_titel.dart';
import 'package:be_happy/fetures/log_in/cubit/log_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
      appBar: CustomAppBar(
        title: "Log In",
        backgroundColor: Colors.white12,
        iconColor: Colors.white,
      ),
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
                    return "Please enter email";
                  } else if (!emailController.text.toString().isValidEmail) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormFieldWithTitel(
                title: "Password",
                hintText: "Enter your password",
                controller: passwordController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              BlocListener<LogInCubit, LogInState>(
                listener: (context, state) {
                  if (state is LogInLouding) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => const Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is LogInSuccess) {
                    Navigator.pop(context); // Close loading dialog
                    Navigator.pushReplacementNamed(context, '/bmi');
                  } else if (state is LogInError) {
                    Navigator.pop(context); // Close loading dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                child: ButtonWithTitel(
                  titel: "Log In",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<LogInCubit>().signInWithEmailAndPassword(
                          email:emailController.text, pass: passwordController.text);

                    }
                  },
                ),
              ),

              const SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (_) => BlocProvider.value(
                         value: BlocProvider.of<LogInCubit>(context),
                         child: const ForgotPasswordScreen(),
                       ),
                     ),
                   );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              ButtonWithTitel(
                titel: "Sign in with Google",
                backgroundColor: Colors.white,
                textColor: Colors.black,
                icon: Image.asset(
                  'assets/image/Google__G__logo.png', // تأكدي إن الأيقونة هنا موجودة
                  height: 24,
                  width: 24,
                ),
                onPressed: () {
                  context.read<LogInCubit>().signInWithGoogle();
                },
              ),
              const SizedBox(height: 5),


              const SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont have an Account?"),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/create_account');
                    },
                    child: const Text(
                      " Sing Up",
                      style: TextStyle(color: Colors.blue,
                        decoration: TextDecoration.underline,),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
