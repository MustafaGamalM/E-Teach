import 'package:dio/dio.dart';
import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/utilis/api_services.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/constants_manager.dart';
import 'package:e_teach/features/home/data/model/course_model.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_teach/features/home/data/model/room_chat_model.dart';
import 'package:e_teach/features/home/data/model/room_mdel.dart';
import 'package:e_teach/features/home/data/model/single_course_model.dart';
import 'package:e_teach/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  final AppReference _appReference;
  HomeRepoImpl(this._apiService, this._appReference);

  @override
  Future<Either<Failure, CourseModel>> getCourses() async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService
          .get(endPoint: AppConstatns.coursesEndPoint, query: {"token": token});
      CourseModel courses = CourseModel.fromJson(res);
      print('doneee');
      return Right(courses);
    } catch (e) {
      print('eeee');
      print(e.toString());
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
  Future<Either<Failure, SingleCourseModel>> getCourseById(int courseId) async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService.get(
          endPoint: "show_videos_course_id",
          query: {"token": token, "course_id": courseId});
      SingleCourseModel course = SingleCourseModel.fromJson(res);
      print('gggggggg');
      return Right(course);
    } catch (e) {
      print('eeeee111' + e.toString());

      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        print('eeeee1');
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, RoomModel>> getRooms() async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService
          .get(endPoint: AppConstatns.getRoomEndPoint, query: {"token": token});
      RoomModel course = RoomModel.fromJson(res);
      return Right(course);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        print('eeeee1');
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, RoomChatModel>> getRoomChat(int roomId) async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService.pos(
          endPoint: AppConstatns.roomChatId,
          data: {"token": token, "room_id": roomId});
      RoomChatModel roomModel = RoomChatModel.fromJson(res);
      return Right(roomModel);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        print('room chat errrrrrrrrrrrrrrr');
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}
