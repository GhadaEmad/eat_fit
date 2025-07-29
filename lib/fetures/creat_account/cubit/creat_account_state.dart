part of 'creat_account_cubit.dart';

@immutable
sealed class CreatAccountState {}

final class CreatAccountInitial extends CreatAccountState {}

final class CreatAccountLouding extends CreatAccountState {}


final class CreatAccountScecc extends CreatAccountState {}


final class CreatAccountError extends CreatAccountState {
  final String errorMessage;
  CreatAccountError({required this.errorMessage});
}
