import 'package:dartz/dartz.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:e_teach/features/auth/data/model/login_model.dart';
import 'package:e_teach/features/auth/data/model/register_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login(String email, String password);
  Future<Either<Failure, RegisterModel>> register(
      String email, String name, String password);
}
