import 'package:be_happy/core/helpers/extension.dart';
import 'package:be_happy/core/widjets/button_with_titel.dart';
import 'package:be_happy/core/widjets/text_form_field_with_titel.dart';
import 'package:be_happy/fetures/creat_account/cubit/creat_account_cubit.dart';
import 'package:be_happy/fetures/log_in/ui/log_in_screen.dart';
import 'package:be_happy/fetures/bmi/ui/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:be_happy/core/helpers/google_sign_in_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CreatAccountScreen extends StatefulWidget {
  const CreatAccountScreen({super.key});

  @override
  State<CreatAccountScreen> createState() => _CreatAccountScreenState();
}

class _CreatAccountScreenState extends State<CreatAccountScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPassController = TextEditingController();
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
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Icon(Icons.local_dining, size: 50, color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.green, fontSize: 25),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormFieldWithTitel(
                    title: "Name",
                    hintText: "Enter your name",
                    controller: nameController,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormFieldWithTitel(
                    title: "Email",
                    hintText: "Enter your email",
                    controller: emailController,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Email is required";
                      } else if (!emailController.text.toString().isValidEmail) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormFieldWithTitel(
                    title: "Password",
                    hintText: "Enter your password",
                    controller: passwordController,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormFieldWithTitel(
                    title: "Confirm Password",
                    hintText: "Enter confirm password",
                    controller: confirmationPassController,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Confirmation password is required";
                      } else if (confirmationPassController.text != passwordController.text) {
                        return "Confirmation password must match the password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocListener<CreatAccountCubit, CreatAccountState>(
                    listener: (context, state) {
                      if (state is CreatAccountLouding) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const AlertDialog(
                            backgroundColor: Colors.transparent,
                            content: LinearProgressIndicator(),
                          ),
                        );
                      }

                      if (state is CreatAccountScecc) {
                        Navigator.pop(context); // إغلاق الـ Dialog
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Account created successfully")),
                        );
                        Navigator.pushReplacementNamed(context, '/bmi');
                      }

                      if (state is CreatAccountError) {
                        Navigator.pop(context); // إغلاق الـ Dialog
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)),
                        );
                      }
                    },
                    child: ButtonWithTitel(
                      titel: "Create Account",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<CreatAccountCubit>().createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text,
                            name: nameController.text.trim(),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
