// lib/cubit/log_in_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../data/repo/auth_repo.dart';
part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final AuthRepository authRepository;

  LogInCubit({required this.authRepository}) : super(LogInInitial());
 signInWithEmailAndPassword({
    required String email,
    required String pass,
  }) async {
    emit(LogInLouding());
    try {
      await authRepository.signInWithEmail(email, pass);
      emit(LogInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LogInError(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LogInError(errorMessage: 'Wrong password provided.'));
      } else {
        emit(LogInError(errorMessage: 'Login failed: ${e.message ?? 'Unknown error'}'));
      }
    } catch (e) {
      emit(LogInError(errorMessage: 'Unexpected error occurred.'));
    }
  }
 signInWithGoogle() async {
    emit(LogInLouding());
    try {
      final result = await authRepository.signInWithGoogle();
      if (result != null) {
        emit(LogInSuccess());
      } else {
        emit(LogInError(errorMessage: 'Google sign-in was cancelled.'));
      }
    } catch (e) {
      emit(LogInError(errorMessage: 'Google sign-in failed.'));
    }}

    sendResetPasswordEmail(String email, BuildContext context) async {
      try {
        emit(LogInLouding());
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
        emit(LogInInitial()); // رجعنا للحالة الأساسية
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reset link sent to your email')),
        );
        Navigator.pop(context); // يرجع لصفحة اللوجين
      } catch (e) {
        emit(LogInError(errorMessage: e.toString()));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }


    }

