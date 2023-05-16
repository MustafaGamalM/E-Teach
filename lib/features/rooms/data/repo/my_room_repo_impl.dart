import 'package:dio/dio.dart';
import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/utilis/api_services.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/features/auth/data/model/login_model.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_teach/features/auth/data/model/register_model.dart';
import 'package:e_teach/features/auth/data/repo/auth_repo.dart';
import 'package:e_teach/features/rooms/data/model/my_room.dart';
import 'package:e_teach/features/rooms/data/model/create_room.dart';
import 'package:e_teach/features/rooms/data/repo/my_room_repo.dart';

class MyRoomRepoImpl implements MyRoomRepo {
  final ApiService _apiService;
  final AppReference _appReference;
  MyRoomRepoImpl(this._apiService, this._appReference);

  @override
  Future<Either<Failure, CreateRoomModel>> createRoom(
      String name, String description) async {
    var token = await _appReference.getToken();
    try {
      var res = await _apiService.pos(
          endPoint: AppConstatns.createMyRoomEndPoint,
          data: {"name": name, "token": token, "description": description});

      if (res != null) {
        CreateRoomModel model = CreateRoomModel.fromJson(res);
        return Right(model);
      } else {
        return left(
          ServerFailure(res['Response']['msg']),
        );
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
  Future<Either<Failure, MyRoomModel>> getMyRooms() async {
    var token = await _appReference.getToken();
    try {
      var res =
          await _apiService.get(endPoint: AppConstatns.myRoomEndPoint, query: {
        "token": token,
      });

      if (res != null) {
        MyRoomModel model = MyRoomModel.fromJson(res);
        return Right(model);
      } else {
        return left(
          ServerFailure(res['Response']['msg']),
        );
      }
    } catch (e) {
      print('===============');
      print(e);
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