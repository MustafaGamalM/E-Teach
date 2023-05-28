import 'package:dio/dio.dart';
import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/utilis/api_services/api_services.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/features/profile/data/data/myprofile_model.dart';
import 'package:e_teach/features/profile/data/data/profile_model.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_teach/features/profile/data/data/remove_account.dart';
import 'package:e_teach/features/profile/data/data/update_profile.dart';
import 'package:e_teach/features/profile/data/repo/repo.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ApiService _apiService;

  final AppReference _appReference;
  ProfileRepoImpl(this._apiService, this._appReference);

  @override
  Future<Either<Failure, LogoutModel>> logout() async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService
          .post(endPoint: AppConstatns.logoutEndPoint, data: {"token": token});
      LogoutModel model = LogoutModel.fromJson(res);
      return Right(model);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, RemoveAccountModel>> removeAccount() async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService.delete(
          endPoint: AppConstatns.removeUserEndPoint, query: {"token": token});
      RemoveAccountModel model = RemoveAccountModel.fromJson(res);
      if (res['Response']['statusCode'] == 200) {
        return Right(model);
      } else {
        return left(
          ServerFailure(AppStrings.unKownError.tr()),
        );
      }
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> getAccount() async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService.get(
          endPoint: AppConstatns.getProfileEndPoint, data: {"token": token});
      ProfileModel model = ProfileModel.fromJson(res);
      return Right(model);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, UpdateProfileModel>> updateAccount(
      String name, String email, String password) async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService.post(
          endPoint: AppConstatns.updateProfileEndPoint,
          data: {
            "token": token,
            "name": name,
            "email": email,
            "password": password
          });
      UpdateProfileModel model = UpdateProfileModel.fromJson(res);
      return Right(model);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}
