import 'package:dio/dio.dart';
import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/utilis/api_services.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/constants_manager.dart';
import 'package:e_teach/features/home/data/model/course_model.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:dartz/dartz.dart';
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
      return Right(courses);
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
  Future<Either<Failure, SingleCourseModel>> getCourseById(int courseId) async {
    try {
      String token = await _appReference.getToken();
      var res = await _apiService.pos(
          endPoint: "show_videos_course_id",
          query: {"token": token, "course_id": courseId});
      SingleCourseModel course = SingleCourseModel.fromJson(res);
      return Right(course);
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
