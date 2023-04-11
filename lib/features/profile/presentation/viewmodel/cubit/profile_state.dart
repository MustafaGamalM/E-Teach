part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

// logout states
class LogoutFailed extends ProfileState {
  final String errorMessage;

  LogoutFailed(this.errorMessage);
}

class LogoutSuccessfully extends ProfileState {}

class LogoutLoading extends ProfileState {}

// remove account states

class RemoveAccountFailed extends ProfileState {
  final String errorMessage;

  RemoveAccountFailed(this.errorMessage);
}

class RemoveAccountSuccessfully extends ProfileState {}

class RemoveAccountLoading extends ProfileState {}
