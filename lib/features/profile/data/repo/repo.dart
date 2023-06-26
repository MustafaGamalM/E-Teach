import 'package:dartz/dartz.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:e_teach/features/profile/data/model/myprofile_model.dart';
import 'package:e_teach/features/profile/data/model/profile_model.dart';
import 'package:e_teach/features/profile/data/model/remove_account.dart';
import 'package:e_teach/features/profile/data/model/update_profile.dart';

abstract class ProfileRepo {
  Future<Either<Failure, LogoutModel>> logout();
  Future<Either<Failure, RemoveAccountModel>> removeAccount();
  Future<Either<Failure, ProfileModel>> getAccount();
  Future<Either<Failure, UpdateProfileModel>> updateAccount(
      String name, String email, String passwrd);
}
