import 'package:dio/dio.dart';
import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/utilis/api_services/api_services.dart';
import 'package:e_teach/features/auth/data/model/login_model.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_teach/features/auth/data/model/register_model.dart';
import 'package:e_teach/features/auth/data/repo/auth_repo.dart';

class AuthReoImpl implements AuthRepo {
  final ApiService _apiService;
  AuthReoImpl(this._apiService);
  @override
  Future<Either<Failure, LoginModel>> login(
      String email, String password) async {
    try {
      var res = await _apiService.pos(
          endPoint: AppConstatns.loginEndPoint,
          data: {"email": email, "password": password});
      if (res['Response']['statusCode'] == 200) {
        LoginModel loginModel = LoginModel.fromJson(res);

        return Right(loginModel);
      } else {
        return left(ServerFailure(res['Response']['msg']));
      }
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register(
      String email, String name, String password, String type) async {
    try {
      var res = await _apiService.pos(
          endPoint: AppConstatns.registerEndPoint,
          data: {
            "email": email,
            "password": password,
            "name": name,
            "type": type
          });
      print('res');
      print(res);
      if (res != null) {
        RegisterModel registerModel = RegisterModel.fromJson(res);
        print('===righttt====');
        return Right(registerModel);
      } else {
        print('====lefttt===');
        return left(
          ServerFailure(res['Response']['msg']),
        );
      }
    } catch (e) {
      print(e);
      print('=======');
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
