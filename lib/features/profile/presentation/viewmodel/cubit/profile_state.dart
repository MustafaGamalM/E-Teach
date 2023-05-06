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

// get account state

class GetAccountFailed extends ProfileState {
  final String errorMessage;

  GetAccountFailed(this.errorMessage);
}

class GetAccountSuccessfully extends ProfileState {
  ProfileModel profileModel;
  GetAccountSuccessfully(this.profileModel);
}

class GetAccountLoading extends ProfileState {}

// update profile

class UpdateAccountFailed extends ProfileState {
  final String errorMessage;

  UpdateAccountFailed(this.errorMessage);
}

class UpdateAccountSuccessfully extends ProfileState {}

class UpdateAccountLoading extends ProfileState {}
