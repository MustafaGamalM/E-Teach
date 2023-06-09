part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class ObsucreChanged extends AuthInitial {}

class TypeChanged extends AuthInitial {}

// login

class LoginLoading extends AuthInitial {}

class LoginSuccessfully extends AuthInitial {
  final String name;
  final String email;

  LoginSuccessfully(this.name, this.email);
}

class LoginFailed extends AuthInitial {
  final String errorMsg;
  LoginFailed(this.errorMsg);
}

// register

class RegisterLoading extends AuthInitial {}

class RegisterSuccessfully extends AuthInitial {
  final String name;
  final String email;

  RegisterSuccessfully(this.name, this.email);
}

class RegisterFailed extends AuthInitial {
  final String errorMsg;
  RegisterFailed(this.errorMsg);
}

// forget password
class ForgetPasswordLoading extends AuthInitial {}

class ForgetPasswordSuccessfully extends AuthInitial {}

class ForgetPasswordFailed extends AuthInitial {
  final String errorMsg;
  ForgetPasswordFailed(this.errorMsg);
}
