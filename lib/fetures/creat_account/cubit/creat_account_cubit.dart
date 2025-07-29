import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'creat_account_state.dart';

class CreatAccountCubit extends Cubit<CreatAccountState> {
  CreatAccountCubit() : super(CreatAccountInitial());

  createUserWithEmailAndPassword({
    required String email,
    required String password,

    required String name,
  }) async {
    emit(CreatAccountLouding());
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user!.updateDisplayName(name);
      await credential.user!.reload();

      emit(CreatAccountScecc());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(CreatAccountError(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(CreatAccountError(errorMessage: 'The account already exists for that email.'));
      } else {
        emit(CreatAccountError(errorMessage: e.message ?? 'An unknown error occurred.'));
      }
    } catch (e) {
      emit(CreatAccountError(errorMessage: e.toString()));
    }
  }
}
