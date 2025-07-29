part of 'log_in_cubit.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}

final class LogInLouding extends LogInState {}


final class LogInSuccess extends LogInState {}

final class LogInError extends LogInState {
  final String errorMessage;
  LogInError({required this.errorMessage});
}

